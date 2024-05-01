using UnityEngine;

public class RotateCamera : MonoBehaviour
{
    [SerializeField] private float _currentAngle = 0;
    [SerializeField] [Range(25, 200)] private float _rotationSpeed = 25f;
    [SerializeField] [Range(5, 20)] private float _distance = 10f;
    [SerializeField] [Range(-10, 10)] private float _height = 5f;

    [SerializeField] private bool _lookAt = true;

    void LateUpdate()
    {
        Rotate();
    }

    private void Rotate() {
        _currentAngle = _currentAngle <= 360 ? _currentAngle + Time.deltaTime * _rotationSpeed : _currentAngle - 360 + Time.deltaTime * _rotationSpeed;

        transform.position = Vector3.Slerp(transform.position, new Vector3(Mathf.Sin(Mathf.Deg2Rad * _currentAngle) * _distance, _height, Mathf.Cos(Mathf.Deg2Rad * _currentAngle) * _distance), 1);

        if (_lookAt) transform.LookAt(Vector3.zero);
        else transform.LookAt(new Vector3(0, _height, 0));
    }
}
