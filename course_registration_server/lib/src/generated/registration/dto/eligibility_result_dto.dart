/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters
// ignore_for_file: invalid_use_of_internal_member

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:course_registration_server/src/generated/protocol.dart'
    as _i9p8z86v;
import 'package:serverpod/serverpod.dart' as _is;

abstract class EligibilityResultDto
    implements _is.SerializableModel, _is.ProtocolSerialization {
  EligibilityResultDto._({
    required this.eligible,
    required this.prerequisitePassed,
    required this.scheduleAvailable,
    required this.withinCreditLimit,
    required this.inTrainingProgram,
    required this.equivalentAvailable,
    required this.capacityAvailable,
    required this.currentCredits,
    required this.projectedCredits,
    required this.minimumCredits,
    required this.maximumCredits,
    required this.messages,
  });

  factory EligibilityResultDto({
    required bool eligible,
    required bool prerequisitePassed,
    required bool scheduleAvailable,
    required bool withinCreditLimit,
    required bool inTrainingProgram,
    required bool equivalentAvailable,
    required bool capacityAvailable,
    required int currentCredits,
    required int projectedCredits,
    required int minimumCredits,
    required int maximumCredits,
    required List<String> messages,
  }) = _EligibilityResultDtoImpl;

  factory EligibilityResultDto.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return EligibilityResultDto(
      eligible: _is.BoolJsonExtension.fromJson(jsonSerialization['eligible']),
      prerequisitePassed: _is.BoolJsonExtension.fromJson(
        jsonSerialization['prerequisitePassed'],
      ),
      scheduleAvailable: _is.BoolJsonExtension.fromJson(
        jsonSerialization['scheduleAvailable'],
      ),
      withinCreditLimit: _is.BoolJsonExtension.fromJson(
        jsonSerialization['withinCreditLimit'],
      ),
      inTrainingProgram: _is.BoolJsonExtension.fromJson(
        jsonSerialization['inTrainingProgram'],
      ),
      equivalentAvailable: _is.BoolJsonExtension.fromJson(
        jsonSerialization['equivalentAvailable'],
      ),
      capacityAvailable: _is.BoolJsonExtension.fromJson(
        jsonSerialization['capacityAvailable'],
      ),
      currentCredits: jsonSerialization['currentCredits'] as int,
      projectedCredits: jsonSerialization['projectedCredits'] as int,
      minimumCredits: jsonSerialization['minimumCredits'] as int,
      maximumCredits: jsonSerialization['maximumCredits'] as int,
      messages: _i9p8z86v.Protocol().deserialize<List<String>>(
        jsonSerialization['messages'],
      ),
    );
  }

  bool eligible;

  bool prerequisitePassed;

  bool scheduleAvailable;

  bool withinCreditLimit;

  bool inTrainingProgram;

  bool equivalentAvailable;

  bool capacityAvailable;

  int currentCredits;

  int projectedCredits;

  int minimumCredits;

  int maximumCredits;

  List<String> messages;

  /// Returns a shallow copy of this [EligibilityResultDto]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  EligibilityResultDto copyWith({
    bool? eligible,
    bool? prerequisitePassed,
    bool? scheduleAvailable,
    bool? withinCreditLimit,
    bool? inTrainingProgram,
    bool? equivalentAvailable,
    bool? capacityAvailable,
    int? currentCredits,
    int? projectedCredits,
    int? minimumCredits,
    int? maximumCredits,
    List<String>? messages,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'EligibilityResultDto',
      'eligible': eligible,
      'prerequisitePassed': prerequisitePassed,
      'scheduleAvailable': scheduleAvailable,
      'withinCreditLimit': withinCreditLimit,
      'inTrainingProgram': inTrainingProgram,
      'equivalentAvailable': equivalentAvailable,
      'capacityAvailable': capacityAvailable,
      'currentCredits': currentCredits,
      'projectedCredits': projectedCredits,
      'minimumCredits': minimumCredits,
      'maximumCredits': maximumCredits,
      'messages': messages.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'EligibilityResultDto',
      'eligible': eligible,
      'prerequisitePassed': prerequisitePassed,
      'scheduleAvailable': scheduleAvailable,
      'withinCreditLimit': withinCreditLimit,
      'inTrainingProgram': inTrainingProgram,
      'equivalentAvailable': equivalentAvailable,
      'capacityAvailable': capacityAvailable,
      'currentCredits': currentCredits,
      'projectedCredits': projectedCredits,
      'minimumCredits': minimumCredits,
      'maximumCredits': maximumCredits,
      'messages': messages.toJson(),
    };
  }

  @override
  String toString() {
    return _is.SerializationManager.encode(this);
  }
}

class _EligibilityResultDtoImpl extends EligibilityResultDto {
  _EligibilityResultDtoImpl({
    required bool eligible,
    required bool prerequisitePassed,
    required bool scheduleAvailable,
    required bool withinCreditLimit,
    required bool inTrainingProgram,
    required bool equivalentAvailable,
    required bool capacityAvailable,
    required int currentCredits,
    required int projectedCredits,
    required int minimumCredits,
    required int maximumCredits,
    required List<String> messages,
  }) : super._(
         eligible: eligible,
         prerequisitePassed: prerequisitePassed,
         scheduleAvailable: scheduleAvailable,
         withinCreditLimit: withinCreditLimit,
         inTrainingProgram: inTrainingProgram,
         equivalentAvailable: equivalentAvailable,
         capacityAvailable: capacityAvailable,
         currentCredits: currentCredits,
         projectedCredits: projectedCredits,
         minimumCredits: minimumCredits,
         maximumCredits: maximumCredits,
         messages: messages,
       );

  /// Returns a shallow copy of this [EligibilityResultDto]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  @override
  EligibilityResultDto copyWith({
    bool? eligible,
    bool? prerequisitePassed,
    bool? scheduleAvailable,
    bool? withinCreditLimit,
    bool? inTrainingProgram,
    bool? equivalentAvailable,
    bool? capacityAvailable,
    int? currentCredits,
    int? projectedCredits,
    int? minimumCredits,
    int? maximumCredits,
    List<String>? messages,
  }) {
    return EligibilityResultDto(
      eligible: eligible ?? this.eligible,
      prerequisitePassed: prerequisitePassed ?? this.prerequisitePassed,
      scheduleAvailable: scheduleAvailable ?? this.scheduleAvailable,
      withinCreditLimit: withinCreditLimit ?? this.withinCreditLimit,
      inTrainingProgram: inTrainingProgram ?? this.inTrainingProgram,
      equivalentAvailable: equivalentAvailable ?? this.equivalentAvailable,
      capacityAvailable: capacityAvailable ?? this.capacityAvailable,
      currentCredits: currentCredits ?? this.currentCredits,
      projectedCredits: projectedCredits ?? this.projectedCredits,
      minimumCredits: minimumCredits ?? this.minimumCredits,
      maximumCredits: maximumCredits ?? this.maximumCredits,
      messages: messages ?? this.messages.map((e0) => e0).toList(),
    );
  }
}
