Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4i8rBMnvNGr/kQYAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Fri, 19 Jun 2026 09:29:13 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6202A6A4568
	for <lists+amd-gfx@lfdr.de>; Fri, 19 Jun 2026 09:29:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=WDaH0UKL;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC2BD10E04A;
	Fri, 19 Jun 2026 07:29:10 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013041.outbound.protection.outlook.com
 [40.93.196.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAE3410E04A
 for <amd-gfx@lists.freedesktop.org>; Fri, 19 Jun 2026 07:29:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fY0rrjLBCFoureMUSrYpzkS6V5MoJN8VLV1Gr2nxOnCjefwaBM9L5bd662gLbqHWUJXXZlUzFZBrUczWo+uYMAk6rOn+Dgx5O79hPvqeDlf1oZwWiJQVaJOB0zpwpEbrNNKhPVdLC5AaJ6iIPZK8ca++peGJGC6C3L5gQb8RmyOBG/yhg6MfQnAeZKfuI0x1Vq/IwCoC0RLuiHCNeyTppYswgx0kio/3s3YINrEoBWRx76dQdLtw/ZIsOHWp30pyXfwkMfmZsR4aywijav2oXPvHbxHs2So2tXu6Ukor1OOorY1ve7irR7G3+HVsK6h/GNmQK7AlQ+NDD10FzSHTmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fu0BZZHi1GMRZFUTx44kK2ogPKb2fJ9UcZ+kAf9VAnQ=;
 b=mezr9f5kPC3ZoObFGE39BMPTPBNvkNRXPuLd7emnj5nbyuld/Ai8N7OboO7EDOG+txG/erncVtzMfC7CmrtlFjgeSW9hkRnAJ5SX352TZEjAbFsE2F5uS1QW+8SeAFRzQC57ptRnwVUj1Nxke4XeNXlqORwHqamjBoASZ27hzK3IKPGd5ewIFVMu+/oWN+fTKiAQxzYjYfR3X00gyoZFRzkMHfzWK9y8M7t4cV8ke4xGE+IZA+E9vrJ+G0uz/tz2Bv0kY3GWijajIi+EVTl1Vk/mGLmjRP8oU9tVH+vJCGCxPajYT/t7moPoGTJkBgA7vBcfAgJPTyE/VUnCInuQ6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fu0BZZHi1GMRZFUTx44kK2ogPKb2fJ9UcZ+kAf9VAnQ=;
 b=WDaH0UKLgHZy57HdVBJK4eVkRrtBLJjcHZF1frcnDHLNFRhyGyPNi0kcqvv5UHTwIE2o5pjr1Hc5Yww90sSjSOxo8MlBejth3BxyrvBOZj6KiEkmAfJwmXEoFIrZKrr5CqUa7k8xaoRcrpONVTDRqz7jHDna/ZWA0aakECldZPE=
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DM6PR12MB4153.namprd12.prod.outlook.com (2603:10b6:5:212::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Fri, 19 Jun
 2026 07:29:07 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.21.0113.015; Fri, 19 Jun 2026
 07:29:07 +0000
Message-ID: <bc27cab4-18de-47a0-86bc-4b7fe3ce1de3@amd.com>
Date: Fri, 19 Jun 2026 09:29:02 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] amdgpu: amdgpu_userq_restore_all return errors on failed
 bo reservation
To: "Khatri, Sunil" <sukhatri@amd.com>, Zhu Lingshan <lingshan.zhu@amd.com>,
 Alexander.Deucher@amd.com, "Khatri, Sunil" <Sunil.Khatri@amd.com>
Cc: amd-gfx@lists.freedesktop.org, Ray.Huang@amd.com
References: <20260618105158.93562-1-lingshan.zhu@amd.com>
 <d2a07581-dae9-45ff-909f-a87795e0b472@amd.com>
 <151c36e3-ead9-42c4-8bc8-1585a7871f38@amd.com>
 <5b36b3f7-f2e2-400f-8ef3-f3d953bb328c@amd.com>
 <73f27315-0b3a-4042-b16e-e49bc005d305@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <73f27315-0b3a-4042-b16e-e49bc005d305@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0347.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f4::15) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DM6PR12MB4153:EE_
X-MS-Office365-Filtering-Correlation-Id: f1bc51c0-e6aa-4b2e-02e5-08decdd47275
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|23010399003|1800799024|18002099003|22082099003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info: xqrp2Nct9A84t/qiWxqTIY6I9N9R/EptNZTY2onFGAMZz+Ug29+Drxb6kjzlZgD7NQrml89YwYINr6ypxBUTjc5yXn9hH0jtM0+iY2G1mIT5wy0oMrhdVaOZsP21Wfadj2X7lTYSsQ4CLYCclqOANbU5dGEgxOjxmhA0IMaItro+zx3R1qk1DP3k2diSQ618a6V8ftmcv9LMJiJgwIHCgV8VMO/+FvuOr/zRqNMDmcmOLES7EbV8oqrWgKy2cgi3QHE/2ZcKDad7FEKSzYd27NVpZCkhkYWAo1REnASbeQxehqizmrAi/Ixyu3uJA3YsSVdzCNKhvORwntnJiwNRcj2hTO/LY7YWh0wA3S/Du5rbkYPZOmFbh4e3OzaRVosiaCDBA57EiIlOcd0N5Ek0afJq0j2BhMUzJkLeKoObUJaIA8lUQrSGl5zGvznV/19u1NcZHLwkvWNa9nenaD0k+VfMkVREZTWnCYgOu3VQYbVdY0xbp5kU5/oUWkRQFqAzfUy7/SGSRmAqp2DuyG2BWhYiLe6Pi56ZzVPkOV0pRRiXWZjG7oAFoRxWJoSp4G7Xn+kxQ67Moe29MRCd7UP1bax0p9HeVkR1s9HATuyfB3ZJQjiwKj/7lzlPFpbuflAy96nk5iuSL7In+4jX0ov84ffXdhBZ/w+5sXpZcwMhsfg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(18002099003)(22082099003)(11063799006)(4143699003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QmVPWGdKRFlqUjA4cWhaRXNiUDQxMW12L3RzS3BXa2NoWXQ2RkRLa05uU0Zh?=
 =?utf-8?B?eVYrVjVmNUFSVTNRWWttZ3p0ek1LSXlKWlJab0ZUTnBDREZ0cGs5MnQ4VjhL?=
 =?utf-8?B?VFJGekx5ajV4NmxsM3BycCtoenZiWUkwdm1yVVFNQ25SdTJRTVJRbmlCZkRS?=
 =?utf-8?B?ZUE0QnMzc0dsUFpURnp1QVpGT0lwT3p5UXhvaXFLQWFzYy84bmd3MXcyZ2Ux?=
 =?utf-8?B?ZHhXb0dwd2JRUU5mZU8zM1h0YUNjaHR3OHpsV1ZBSE1KRy9KRXFWRVJWQzVN?=
 =?utf-8?B?SEJzVklreGwwTFNtdG1oMlhuYVA2OXhVbUZ4SXEzVFNqdk4wU2VYbDVyV0Ez?=
 =?utf-8?B?akhNRjN4V01xRXdhZEVxUGRRdVNMei9hVEhWWXJhY1Myd1RLRzRudkdxUkxm?=
 =?utf-8?B?TEZFMmFwRTM4T3F3UVlBQkFZYmFDdkhNV2ZvWjZ0NCtzUDVXcGVwZ0U0cUQz?=
 =?utf-8?B?L3ZrdFlJdGhodUxOdCsyUHhmYnhCd0VHckpmdDZzRlkyVDhpQzF3d1B4cnFx?=
 =?utf-8?B?Z1RHOXBvTVgvVUdlVlJSblJNV0JiMjQxRzZjYnozc2tibmROczM1RzlEQnJ5?=
 =?utf-8?B?SlZ6bGhrTTdibzArdTJtU1JUNGJmUVJvMkRMK2pwQVErc1FmT2N4b2xpSEFr?=
 =?utf-8?B?ME9WbjRtNW5WYUZUVTBTQ2gvcHNvVzdUd3cra2F2WExtOTUwMVdKQ0NadGlC?=
 =?utf-8?B?emV1aVlEMUdudXhCcnRKdDJYS0pxem5FUGhXR2s3ZlBKQUdXYjI4bjVINDhV?=
 =?utf-8?B?eTBIUkM3aWc2S3ZrbHlmLzZZanR1czVXdXEyUitmb3FKdDlOMS9ZWXJJVUlw?=
 =?utf-8?B?T1pTWXlseUEwZ1B5elYzMy9XT1Zzb1dGMWlmS0J4V2twd2RmM2NkRFp6Zmtz?=
 =?utf-8?B?a2t3a3RMQkRKUUlhZW9VNEQ0NTlzMmRNZVNvNndOZ2t4bm9vOEdnOU44YzNr?=
 =?utf-8?B?VmZuVzlPbk85SmowaTBCZXVJNVdnQTFoYS9XRU42eWNsRndoQmZ0cVg2aWIy?=
 =?utf-8?B?L0RnNzRoOFVmK3Z3UnI1dnFnR2pGZTAycWxwSWcyQ2xaaHZHcTdNRllVWXdU?=
 =?utf-8?B?dFBIZUFaQVlxU2Zqemc5MWd1aFRTMDZRVHpYeTBhZGJLbDR6d2hQdm8vWjZT?=
 =?utf-8?B?cndCWEFiSU4yN0lPdWRvUXIxZDVqNmVWMkVHbFhiU3ZkTEViUHJjN1ByMW9B?=
 =?utf-8?B?UHJ4QnFFZDVUYjNZeWlUOHNLOUdLR0RuSXJnWE9LU1hkZGdHcGh2aFVIOFZ0?=
 =?utf-8?B?UStxWllZOGZ6d2JEUFlKTDJ4dTRlV21jUG1NVUFubHpJMGNsQ0Y3V1YvVkJV?=
 =?utf-8?B?N0Y2MDZtbFlFL2VmYXlOa3V6RDlwSnpnQzJOOUdydzk1Nm84SFJTVXgrcUxW?=
 =?utf-8?B?eEFmOHhMcnlOVWQ0QmdNTzRLNllQaVRyRjRUTlkvUUdaWmtCQjRaeG1nckE3?=
 =?utf-8?B?UHFVdHdoVHl5cVRRM0tOWC9lZE9sa0NYakVGU0NEdXBPbk9SM3hRTHIwaWtv?=
 =?utf-8?B?MElHaXZOUU1mNTVGa0ZXbFg4aEhUS2tNdGh0TmZMV0U2S3VmWXpFd2ZHeFRj?=
 =?utf-8?B?WGRWN1pCUnBQVk5oa2t0QmxZam1xdm95Y0xReXR3WnE0MVpZUjZnZVB3UWRM?=
 =?utf-8?B?WDB2bGxKazdJeEkvL2J1RUVyVnl2RytMcVFoNmV3bU82ZUp5TFE0amtYMk9X?=
 =?utf-8?B?R01UT2NZT2xzTzdrV0hKc0F6VE9wNWRFaW1uQjNuRU9sQTRCaDNZc1IrNkJ6?=
 =?utf-8?B?dGMyMVNJb2c5VlQ5ZHpjbm1HUTVKcGJOTXlnNnphUEVoVlN6VnRqbklNVDB2?=
 =?utf-8?B?c0lRZXo1anoyNTdHa3JIY0kzdTdVekhYditpRFZUZ0NjV2tNaStMMVdlTTFJ?=
 =?utf-8?B?cEUzUnRSWExqZU1zL2Y3ODFMeUF6VjRIeGpFRVdBMXVQREhGaGY2Tm9QK3V1?=
 =?utf-8?B?cUwyNEF1eTFsS1hqQUNrUk53K3I4TTBnY0ZvdDNZa3NKdnZTWlM4OXdKclRw?=
 =?utf-8?B?UVBqUjNveGpseWVpN1Q0eUtoWEJ6QmdDRlI2R0F2ZTB4d1RYN1RTallMTi81?=
 =?utf-8?B?Mkl0M0F0dFI0T3NQeHVud0pBQkRPM3lYV0lzdGthbWdxeGFqQkhSbFh1VU4v?=
 =?utf-8?B?eXhLQlpxTDNVMldJZ015MFBUV2l4YVFwcGtLbFFYSjFNVkc0YU5KWGlUc0dh?=
 =?utf-8?B?eFdzUGpBMUVTd1U3SGwwU3h5a0pkbHlBRVdMcW1Nazk0OXpzcWYwT3grVzds?=
 =?utf-8?B?RkUyL3JoSCtWOGUxSlU4QnJXVlp2clphTUFwNnJaczgrbnJrWEtlOVJZMHJ5?=
 =?utf-8?Q?8yQhkJuCHXoFfYEKv9?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1bc51c0-e6aa-4b2e-02e5-08decdd47275
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2026 07:29:07.1929 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l3CRzRcDyCU8LPR41xLFGeK29c7qwh0BxQo4dfflYVQMGsxBmVj2OgRe0aS7J1PV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4153
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion list for AMD gfx <amd-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx@lists.freedesktop.org>
List-Help: <mailto:amd-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=subscribe>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:sukhatri@amd.com,m:lingshan.zhu@amd.com,m:Alexander.Deucher@amd.com,m:Sunil.Khatri@amd.com,m:Ray.Huang@amd.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[christian.koenig@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[amd.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[amd-gfx];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.freedesktop.org:from_smtp,amd.com:dkim,amd.com:email,amd.com:mid,amd.com:from_mime,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6202A6A4568

On 6/19/26 07:51, Khatri, Sunil wrote:
> 
> On 18-06-2026 06:59 pm, Christian König wrote:
>> On 6/18/26 15:18, Khatri, Sunil wrote:
>>> On 18-06-2026 06:12 pm, Christian König wrote:
>>>> On 6/18/26 12:51, Zhu Lingshan wrote:
>>>>> In amdgpu_userq_restore_all(), when failed to reserve
>>>>> a bo, it should return a meaningful error code other than
>>>>> "false" that means SUCCESS, which is wrong.
>>>>>
>>>>> The caller should not ignore the return code of
>>>>> amdgpu_userq_restore_all as well
>>>>>
>>>>> Signed-off-by: Zhu Lingshan <lingshan.zhu@amd.com>
>>>>> ---
>>>>>  drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c | 10 ++++++----
>>>>>  1 file changed, 6 insertions(+), 4 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c
>>>>> index 95b680fc88c5..8b14870afbf5 100644
>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c
>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c
>>>>> @@ -894,9 +894,9 @@ amdgpu_userq_restore_all(struct amdgpu_userq_mgr *uq_mgr)
>>>>>  	unsigned long queue_id;
>>>>>  	int ret = 0, r;
>>>>>  
>>>>> -
>>>>> -	if (amdgpu_bo_reserve(vm->root.bo, false))
>>>>> -		return false;
>>>>> +	r = amdgpu_bo_reserve(vm->root.bo, false);
>>>>> +	if (r)
>>>>> +		return r;
>>>> Good catch, but that amdgpu_bo_reserve() is called here is a bug in the first place.
>>> I think i probably missed that. There is no return value check for amdgpu_userq_restore_all and this cant fail. We should wait uninterruptible here i.e change false->true and drop the if condition.
>> No, dropping and re-acquiring the lock is a broken approach to begin with.
>>
>>>> The call to amdgpu_userq_vm_validate() must be moved into amdgpu_userq_vm_validate(), right before we call drm_exec_fini() and the manual call to amdgpu_bo_reserve() here dropped.
>>>>
>>>> Otherwise we have a small windows where we drop the BO locks before starting the queues which could make the VM invalid again and cause all kind of issues.
>>> we need to maintain order of locking First reserve root bo and then take mutex else we had mutex deadlocks.... this is why we have added root bo locking first before taking mutex in next line.
>> As long as we do that in amdgpu_userq_vm_validate() that should be unproblematic. The VM root BO and all other BOs are still locked and acquiring the userq_mutex shouldn't be much of a problem.
> 
> Are you suggesting to move amdgpu_userq_restore_all inside the amdgpu_userq_vm_validate? Current order is we amdgpu_userq_vm_validate and then amdgpu_userq_restore_all. So if i get it correct, while we have the exec locks just before exec_fini, after amdgpu_evf_mgr_rearm, take mutex and call amdgpu_userq_restore_all?

Yes, exactly that.

Christian.

> 
> Regards
> Sunil Khatri
> 
>> Regards,
>> Christian.
>>
>>> Regards
>>>
>>> Sunil Khatri
>>>
>>>> Regards,
>>>> Christian.
>>>>
>>>>>  
>>>>>  	mutex_lock(&uq_mgr->userq_mutex);
>>>>>  	/* Resume all the queues for this process */
>>>>> @@ -1133,7 +1133,9 @@ static void amdgpu_userq_restore_worker(struct work_struct *work)
>>>>>  		goto put_fence;
>>>>>  	}
>>>>>  
>>>>> -	amdgpu_userq_restore_all(uq_mgr);
>>>>> +	ret = amdgpu_userq_restore_all(uq_mgr);
>>>>> +	if (ret)
>>>>> +		drm_file_err(uq_mgr->file, "Failed to restore user queues, ret=%d\n", ret);
>>>>>  
>>>>>  put_fence:
>>>>>  	dma_fence_put(ev_fence);

