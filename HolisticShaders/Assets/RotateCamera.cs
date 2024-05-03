using UnityEngine;

public class RotateCamera : MonoBehaviour
{
    [SerializeField] [Range(0, 360)] private float _currentAngle = 0;
    [SerializeField] [Range(25, 200)] private float _rotationSpeed = 100f;
    [SerializeField] [Range(2, 20)] private float _distance = 5f;
    [SerializeField] [Range(-10, 10)] private float _height = 0f;
    [SerializeField] private bool _lookAt = true;
    [SerializeField] private bool _stopRotation = false;
    [SerializeField] private GameObject _target;
    [SerializeField] private Vector3 _targetPos;


    void LateUpdate()
    {
        _targetPos = _target is not null ? _target.transform.position : Vector3.zero;
        Rotate();
    }

    private void Rotate() {
        if (!_stopRotation) _currentAngle = _currentAngle <= 360 ? _currentAngle + Time.deltaTime * _rotationSpeed : _currentAngle - 360 + Time.deltaTime * _rotationSpeed;

        transform.position = Vector3.Slerp(transform.position, new Vector3(_targetPos.x + Mathf.Sin(Mathf.Deg2Rad * _currentAngle) * _distance, _targetPos.y + _height, _targetPos.z + Mathf.Cos(Mathf.Deg2Rad * _currentAngle) * _distance), 1);

        if (_lookAt) transform.LookAt(_targetPos);
        else transform.LookAt(new Vector3(_targetPos.x, _height, _targetPos.z));
    }
}
