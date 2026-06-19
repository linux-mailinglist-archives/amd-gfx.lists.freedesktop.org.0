Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id SV7HG6N4NWr4xAYAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Fri, 19 Jun 2026 19:13:07 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD9C36A7406
	for <lists+amd-gfx@lfdr.de>; Fri, 19 Jun 2026 19:13:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=CweV9VwT;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AC0010F6B2;
	Fri, 19 Jun 2026 17:13:05 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013045.outbound.protection.outlook.com
 [40.93.201.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 909B510F6B2
 for <amd-gfx@lists.freedesktop.org>; Fri, 19 Jun 2026 17:13:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i4KzYHFA1iiEGuu5VJB7XZXX0Sh0SfmdIVhjccvI7KS8Kt5DWMZBTrC01A5wnZc9kTIbKpZ1kYHHz8MbQm+TOcXIDvhioQ99npaZYHpTKJDv/xb1w5KhZC3rtYa6j3GywhLg1JaJdsxTPqc+2DUbij1Gai4ql34fozmSJd2CRJItCwyKBv7A0JOmzmI13/sZQtlwbEZuUBO5miU1QiBzcKTJSYOJj4Zqlbgoa8vt+knI3OlNg83j/1FTzAbDOoz97MYPcAnH21S7s5Rk9aBrVNpNNepXxXMj0tAQGQxIq/ag9o18eRGXiy4NJvVQYP2pmFc1DYjz34qBu1ZJ+amHjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OeSJleKyjItqkbduEyUQmycRKa23xWhpvs1lgP250/E=;
 b=y9vWMRutHQo67t5AdEnH4NAs/Kh2zeThDVMWErt6u9KaOsCR2FHaGMqtjvkOkWsoWjovb/TpfrJDwCkpSv10DiKn8/M7GpE84ao7pQpDxg71nkeCrNujYgYxUFRWHp/Nib28At99nzfnWlqdOYq4Rz9vSnrKpk537BKewUZY0xCujlXl4M9VCuM9yAfGK/xYVcfwd9DM9U37RCnuOZ7921iSUss+KOW9C1wUUWG0k+DLu6Jh1M0fa5jQNRi9sG5qJOPwUxR4vdD87XD9gy8t1AXW+7bDABjLHKUmVzOZAEdC317aBPbQlVxf1eW9u0M04xln9xjr030zgsIICeAuhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OeSJleKyjItqkbduEyUQmycRKa23xWhpvs1lgP250/E=;
 b=CweV9VwTNguCvHeBIS0o5ghIdTNU5OZfC1z5YJm5jCB9F/DcyrNj2EWQaeeAe5QLU7NQobdV5QUzsfk0rQXUaPJhzsceWVDOJpFkDDupzjB4hcRDnleepwKI2OmBYMVXDNPRbGxMhxwGwhwrs6rjqq8Srpt2YYRMGnLCiWbcAGI=
Received: from BL1PR12MB5336.namprd12.prod.outlook.com (2603:10b6:208:314::8)
 by DS0PR12MB7946.namprd12.prod.outlook.com (2603:10b6:8:151::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Fri, 19 Jun
 2026 17:12:58 +0000
Received: from BL1PR12MB5336.namprd12.prod.outlook.com
 ([fe80::576a:69b5:929c:8640]) by BL1PR12MB5336.namprd12.prod.outlook.com
 ([fe80::576a:69b5:929c:8640%4]) with mapi id 15.21.0139.009; Fri, 19 Jun 2026
 17:12:57 +0000
Message-ID: <4fcd952a-3030-40b7-abd3-5129fd8afb87@amd.com>
Date: Fri, 19 Jun 2026 13:12:54 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amdkfd: change a PTL warning message to debug message
To: "Russell, Kent" <Kent.Russell@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
References: <20260619164558.93761-1-jinhuieric.huang@amd.com>
 <BL1PR12MB5898202E60A4F9B4510095CF85E22@BL1PR12MB5898.namprd12.prod.outlook.com>
Content-Language: en-US
From: Eric Huang <jinhuieric.huang@amd.com>
In-Reply-To: <BL1PR12MB5898202E60A4F9B4510095CF85E22@BL1PR12MB5898.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0172.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:110::12) To BL1PR12MB5336.namprd12.prod.outlook.com
 (2603:10b6:208:314::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5336:EE_|DS0PR12MB7946:EE_
X-MS-Office365-Filtering-Correlation-Id: d4ee0a22-788f-4a05-6c32-08dece260260
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|23010399003|1800799024|22082099003|18002099003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: b6kO9RFqYe/dCHyB4+tcip82BMVtth/+wQ+UidOROpEZ4XJkMcL+NjhZbx11+xtLSgciMe/EhZRsGjN+kOi74DqzGara+y4Vf3nlkzGP+p2jvOaCQR/A9swYdH3l24BPaoOxzFPN9KSeUxLcb8vi5+drJ0IS36KIZ0WBBodgLHj3Bse/X+0zgLfjvSTfhn3PkFZQPS4QLCeyDpEKukXBuE5JyLS+I7qdhJz862mGa4NkNNgS5/k8c/fH3+Dna8Ep1kXIz0ASIlglpacno6FDGWO7YFDpeVLX1Uw0UkT+65hs6EoVbEsPFQMJWLlV8REuGeE+9S+0ISm7iaZ1NhEiWSykQ9vrAdIJQ9GDrs+ja51CX9qHRLCc+6cVr4rECnliCSheeca/q3lSrLB7pCXy4TZiqUqNwXP3Dai8S3bLBAXSdlnm0sOTTIBfRPcY8Q0ApKHHa5uOAzzpwXtvcJ9MeULULr9jSx72AAuzxUAXt1S9KFPPTy23NwfHXLwyBMjztRBCBaanuZguTIJI6GOuiQwE/Ovgw4jnpi7BlwlQNUWgDWWrvF3gtIiXgkdcF+PNOPGFs7b+ljykFTuzWZMJmMOVHTYGvDwDgsofloHvYMVFz6GD/zoMEJP3bfbMx6YbwvZS9K1N7jmPxgIDyuhuL/biU5Djl4Nz3UlES9NsNLE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5336.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(22082099003)(18002099003)(4143699003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V3BDV203Y0gra3RSaTdQTHMybzltTjRCbnl6d2c0VDViOEp2eVAwbGR5L0dk?=
 =?utf-8?B?YXQ2cUpNUTAyTHFMaHJIZVNCaktPRlRZV0Y5enpFU1RCNGpMRnZESGhIRDB0?=
 =?utf-8?B?WmlWYU1CTzJub1dpSS9KdWZFMWl3cDZWMDlFTm9sOWd4V3VJdGVPcUxFVzdx?=
 =?utf-8?B?UVdhb0pGV2VQRG5mcWI0U1ozWDQrYWtXZktJN2JqMkQwUHQ3cnpEQWk1UEh0?=
 =?utf-8?B?cFlTZmVEdFBTLzVJRXpkdkFMNWtxWXd5UEc2VjVYRVlZWmJMVElwWml4dkJ1?=
 =?utf-8?B?ci9MU3ZlYzIralpWeEZDalFMdFRYY1dwN3BxZVJ4SEhUR2NUM1JsbVB0M2Y3?=
 =?utf-8?B?Y0tvVU4rTzFkUkpOWU9wdlh4NXlnWTBxU3JPYUFqOGxORU9Nc2UweWVIL2dw?=
 =?utf-8?B?Nnc1bS9tcDhibUtIZUo2UUlRUmtJQk43VDVDYUlLQ3FmVWg2RnI1dXgzVlI3?=
 =?utf-8?B?RDhzLzNkTXlGZEZaZnlmYmprV2J4R2FvcFp1S3c3VzJTMldCT0w3b3hRbVVq?=
 =?utf-8?B?aVRkZkJZZlREU09QZjdMS1FOMCt1aXMrS05UMHpCemlqbk9WYUd3S29MQURK?=
 =?utf-8?B?WE9PN0NFQXQ2VFM4dkhWQ0dhU3JnYi93UjZmWGJkWlhER2xIcjdraVBxN09h?=
 =?utf-8?B?Y0Vnend6Y1lKV3UvZkRnTHNnTm5qRTRWOVNCSWNTL0lGWVViZGdGbXlqVTA2?=
 =?utf-8?B?bVVYTDhkYVhsc3laUTFISnVWQ3p0a0ZXak12RWgvSHVqSHBidlhEbG96REZZ?=
 =?utf-8?B?czNRaXBwbmFVQ1RwWnNwNUFwQlVDeHhMcEpYdjJhZzl3RUZFeFVudUdZbnAw?=
 =?utf-8?B?N0R1VmhTYTZ3ekJXZUhlUUZnRGFueUZOVG1WWXlaUEtpM2NZQ0t5bHUvZExm?=
 =?utf-8?B?UFhGRHFQVFppTnVKZzhtZDE1bTUyeE93c3hCdTNKQ2lQdlF5M25RZkhRaEVB?=
 =?utf-8?B?R1JrdTJadWQ3Z250UlVyU1pkZ1FieStxYkdsYkRESTVTbTFsL2J5N2ZQck1J?=
 =?utf-8?B?K3krMkpzOHhScFJDR2RYakdkUkFaMmVDSUpQb1p1ZlZXazlhWGtRUE9qcmhB?=
 =?utf-8?B?dHdVS0Nic1NDc25TYkhQQ01UbE1oZGV6dW1xdG1lbGRBbTM5VmFBb2pkcU04?=
 =?utf-8?B?bGZnSUZVby8rVmM1NndCLzJRaHpncUIzclJ6MnY2cTdTS1ZzdlJSY2JpTTdi?=
 =?utf-8?B?SmZBS3JwMHpJeTBVaXVNaTJZcWg3WmdNQ1I0Z214ZmFnYUZVTy9VVlF6Nldp?=
 =?utf-8?B?SjE5dFd2K2g0aUtzZGtGMm8zbVlpbStxV1gya2VTbzAwMC9kVnMzajFLanNZ?=
 =?utf-8?B?TmtaRWxmZS8rRlRyVWcwUlFMY0JnNklTZFdDVzdvMjFxVDI2cGhiWHZFRHNH?=
 =?utf-8?B?U1NodEo1K1dSWW9QekdiSUxkYlBmL2FhU2RrQWxEVE5xQmJCN3c1bEFVc1Ax?=
 =?utf-8?B?ckxHK09Oc2wxcWFoZlVXNmZCQ3BSa2Vvam9IeE0zMkt6b29MajdFZUhXRmxw?=
 =?utf-8?B?N3ZPbEQyaXRmYnJqSWp3TStwNHIzSUxwU0tDbDR1dnRmdU5XUkttSVI4aTNn?=
 =?utf-8?B?dGdZZmtFZXRkR1RlZ0pmSEsyRjk0RW1SWHE5Z3ZORDV4ditJQXE2N3A0RU1G?=
 =?utf-8?B?RDlBcy94dGE5T3VieWVKNElkZExBVnl5OVRabjdsWkRoVVo4NW85SG9obnVo?=
 =?utf-8?B?ekxFTWNZOTNUNnNiblBlY2ZRcXVXMk1oU0VobUVHTCtZMzBMdjd2cnF1Qnkr?=
 =?utf-8?B?QUtlUkx2ODZMSzh6ZE5VczFyVkU5NUFlQ0hFbDJyS2ZzTS9pTjVtRmh3VzZo?=
 =?utf-8?B?MlRqR29VNXU3eE9lTitYRnZUTHhXbFdJZmhQMXR5WFQvUEpSTWJvMTNjZzk4?=
 =?utf-8?B?TFhVQ2t1VzVBS1Bjemt2UEpWTlk2bDZqY0FyakV2NEE2VnkwL1hvNlJFdTZ4?=
 =?utf-8?B?bHpwK3FaN1pDZStNNEtoYjN6OTRReW80K3hKUlpJK0dKeC9LVEVWQXZlNTI1?=
 =?utf-8?B?SmRRelVpL0NsdndzQStDbytSaUFkK3haaDZmMG9ZVXo1VXRnQStHWTF1Sk1u?=
 =?utf-8?B?NDZ2c1RNVWoyWDBjQ2RkRnNSNWpIdGNBSWtucHp4cEVsSzRpbGIxN1FHZEl5?=
 =?utf-8?B?TlNMTm5SNmlKUUxIbElzMU1naGdTNjRHc091ek5HaDBzNGt0N2FpZDhnQVNr?=
 =?utf-8?B?RzVnU1drbEcwaGNxQzgvb3hFdGxTekdDYjZFdERtcXY2MEUwWXJMREhwRFpi?=
 =?utf-8?B?YTBTa0tmSDVESXZXRElUcTQ3NDk5aWZ5RUJ2UGFTZll2Snc1dTlHRWdEVGZs?=
 =?utf-8?B?OGNMUEF6YzNycVJWQTQxbk8yWFRzQmNEcVFsUVlrREZadHhTd1VmZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4ee0a22-788f-4a05-6c32-08dece260260
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5336.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2026 17:12:57.8154 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +RUWyxK6nh5knWU50IwRxaIpR2M6akjcRc7UplOSyfZN3KDG7oj2yXEGlxaBF3GgepkMJ0lW0hC9+/qFL4RIfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7946
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
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:Kent.Russell@amd.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[jinhuieric.huang@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jinhuieric.huang@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[amd.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[amd-gfx];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:dkim,amd.com:email,amd.com:mid,amd.com:from_mime,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,lists.freedesktop.org:from_smtp,lists.freedesktop.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CD9C36A7406

It is a good idea, thanks!

Eric

On 2026-06-19 13:04, Russell, Kent wrote:
> AMD General
>
> Shouldn't we be putting an
> if (ptl->hw_supported) {
> Call in the kfd_profiler_ptl_control function instead? Instead of papering over the issue, we should only try to do the function if ptl is enabled.
>
>   Kent
>
>> -----Original Message-----
>> From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> On Behalf Of Eric
>> Huang
>> Sent: June 19, 2026 12:46 PM
>> To: amd-gfx@lists.freedesktop.org
>> Cc: Huang, JinHuiEric <JinHuiEric.Huang@amd.com>
>> Subject: [PATCH] drm/amdkfd: change a PTL warning message to debug message
>>
>> PTL is a special feature for gfxv9.4.4, but the warning is
>> always appearing on other ASICs when rocprof is running, it
>> causes confusion, so reduce the message's level to solve it.
>>
>> Signed-off-by: Eric Huang <jinhuieric.huang@amd.com>
>> ---
>>   drivers/gpu/drm/amd/amdkfd/kfd_chardev.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
>> b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
>> index 575b13b557af..566955adb58f 100644
>> --- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
>> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
>> @@ -1813,7 +1813,7 @@ int kfd_ptl_disable_request(struct kfd_process_device
>> *pdd,
>>                ret = kfd_ptl_control(pdd, false);
>>                if (ret) {
>>                        atomic_dec(&ptl->disable_ref);
>> -                     dev_warn(pdd->dev->adev->dev,
>> +                     dev_dbg(pdd->dev->adev->dev,
>>                                        "failed to disable PTL\n");
>>                        goto out;
>>                }
>> --
>> 2.34.1

