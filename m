Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B73213B71A6
	for <lists+amd-gfx@lfdr.de>; Tue, 29 Jun 2021 13:55:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 317276E87C;
	Tue, 29 Jun 2021 11:55:44 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2087.outbound.protection.outlook.com [40.107.92.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24B036E87C;
 Tue, 29 Jun 2021 11:55:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gub7HMTMBPbaMshcklogGgwtQXAMZshB3FXN46MxPTgdv0dBJmPxJ3rwSB2sqASOAxqtrmlFqBZVgdKVMWcm3d0lMtDGcHAYiqpStSDacAIDnJ4oBU9/QF+6Y/mYtYQCswc+tuSgVT6d9aTIhpiLsrlT0FuZ5FbSCZfoS2mcWvy5cVqwueBThrdW570G8xnM8JvVdwVNABJE57xN/Q2JrXd5lqLR1zdf5lX4knYkgPaZNiP/5FsZ2KyN+HzRwD4pfuKiH/jm+WBzo89KUIqSbDbWt7tx5gF+ZwgXgo/PMnuk/red1DYhyhjBwmMpqFM+ROJSqPD5gq/BEogwuXotcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t8cYwl4V95i9dR/d21ndFvAEKUfkTNwamg9cbu6pdRk=;
 b=ajfPmT9lK6xPBeyOJoR7uHRSB8MHk1vRp2QNIVWNpZLTlLAIWOdjSW5Lw5XTdB9fYvLVFUVmoxvMHCOGlVK5YOIa2xIz1tAMpvjmAGLhwtdirod0h2XQJmqzAuFWtOkg6oZsf43rh17Gj41zGrtcHi1qMncxxGBtBVLN17PTrFny03aqGB1vX17IwzxRtLGHmditf9VHZkG4Gev9gsmera0U32qbvWoRMzpGm2RqrXzSMvhjo6s3u4QQR5s8OEv8e9zRLVUm+z6Kg/+GGJg9guCAboCU4CqQ6iHqpKubVjjg+Bs/ukn04Ng4nn5xDKItdKtkm+OOQ+c9P0IulvhBPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t8cYwl4V95i9dR/d21ndFvAEKUfkTNwamg9cbu6pdRk=;
 b=rBTiGXzBkjhYSrIKnGrrq2ZHUAC+m35UsmdFi1vdLtNIzvw9QOBkDV10cUIG63r+kAS4HHIo0LtOEPSFRL916FpK3q5GoQwCjP8RlVjDpbXhOirzY+QDczmgbaoJhMFuBBcBkSyUdzliC7svM7tGa5zxFPP8QQOuqwOtjOf7Dpk=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5136.namprd12.prod.outlook.com (2603:10b6:5:393::23)
 by DM4PR12MB5294.namprd12.prod.outlook.com (2603:10b6:5:39e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.23; Tue, 29 Jun
 2021 11:55:41 +0000
Received: from DM4PR12MB5136.namprd12.prod.outlook.com
 ([fe80::901b:72bb:a15:2a68]) by DM4PR12MB5136.namprd12.prod.outlook.com
 ([fe80::901b:72bb:a15:2a68%4]) with mapi id 15.20.4264.026; Tue, 29 Jun 2021
 11:55:41 +0000
Subject: Re: [PATCH v3 1/1] drm/amdgpu: return early for non-TTM_PL_TT type BOs
To: dri-devel@lists.freedesktop.org
References: <20210629114413.3371-1-nirmoy.das@amd.com>
From: "Das, Nirmoy" <nirmoy.das@amd.com>
Message-ID: <5e09fdad-67dc-d210-6696-613f6266e98d@amd.com>
Date: Tue, 29 Jun 2021 13:55:36 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210629114413.3371-1-nirmoy.das@amd.com>
Content-Language: en-US
X-Originating-IP: [2003:c5:8f27:5d00:9499:a270:2927:4d86]
X-ClientProxiedBy: PR3P189CA0055.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:53::30) To DM4PR12MB5136.namprd12.prod.outlook.com
 (2603:10b6:5:393::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2003:c5:8f27:5d00:9499:a270:2927:4d86]
 (2003:c5:8f27:5d00:9499:a270:2927:4d86) by
 PR3P189CA0055.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:53::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4264.18 via Frontend Transport; Tue, 29 Jun 2021 11:55:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 60d8c243-09d7-4a49-a324-08d93af4d195
X-MS-TrafficTypeDiagnostic: DM4PR12MB5294:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM4PR12MB5294D48732A18AF44E8C82078B029@DM4PR12MB5294.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cwJlxo4OM3hEcxHMXaRRigFrSsdLCOmEBindoxSoMEN66Ub9rnOYvrTV0eE4vV85Jh6hXIjDaTSekNiNGq8qsFQwuuLmDLmABxsoaHxQMlGHxP3FOY2bx50r8VM/4prgI1gGJCpfVe2qLSeUdwvXm+27w/DVtOSh7gWEsfl6MgrRRFXl4HJX8kcahc61jCignR0lyfhMRtw30rT0P3fr93mNxcujR+Eyg2tx2JSTmosoZqXbI94wiciTQ5QnEEJyiet+AsPVJZGYP5O5ds0+znmUqlnVC15H4IGB/sgxD1vANCAMUSnQBBeMjgx+avi4KyZrKMFKFQX2kRPnMnk6o5Mlk/rUyBcrP1lMJ5Xrxyt4csCIJyYyf/q6CVuPGbtWdQwV5yAnXzfk4sIRfre48q22/xcq7rTkcf/jHyGG5ZeLeRvvj84yG9I6QYUdKOKA4PmMr8ZZJALiV//qLb7OKYO/87mv8LdRp8d1eAlh6e14afoUbox78IbtZvG1NDq7rHpd4wVv2KM8C3aIMRCb/96ELI6kEJ6PPUDpofU+HrMMS7OzdU/O5010IPVSN6kmLCY6nrCitzBFf2EmEJdMZLPYoBX1syzI1n3XBRk0tcJfzZmoBsP4XdOOpP2wC1gcnjwU+qgFX8lwiOG2gvh5PqE23qDjwrtJ9LaP7ir6xgBGxXabIA0+fCHqzyXj+GiYjTG4laH0lg89U5WK8ITolwzfdJfriAbeITx3uCpEqa6xYzFb0x7uZvQCP0QM7ne3
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5136.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(366004)(136003)(39860400002)(376002)(8936002)(53546011)(2616005)(6666004)(8676002)(4326008)(31686004)(6486002)(478600001)(316002)(86362001)(66574015)(66946007)(66476007)(66556008)(6916009)(52116002)(38100700002)(5660300002)(450100002)(36756003)(2906002)(83380400001)(16526019)(186003)(31696002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aTZpcGNXSi9ObGFPK3NJMExPL1B0Ky9KbVhEUFV5dnRFaEJFNTBhVHptTUpO?=
 =?utf-8?B?S0VlR0J1dEdwRm1SN01DSFFXVFJCMnFSSU9jZnk1eDdRemVFUXBPcXJ6cjly?=
 =?utf-8?B?UWhYUTVoMFNXMWJqUlRNSmNnK01CbTZPck1wWU9qYU1oYk1GQVJkR2VrRmFi?=
 =?utf-8?B?dmtSTGdMYUdmMGNJeGd3TzlSazduWlBkTGVqR05raThDY3J0b0dCQ1VDdHgx?=
 =?utf-8?B?NWd6UlJxdDV1K1F2S0FhQ1BVM0poY1lpem5EZTdudW9VbTVyOEJWT21CaUJ1?=
 =?utf-8?B?Tld2OGdXZ2ZzRmtPYjlIaDdxbjdMT0RzeWMzZ2R6SWRuYVN3dVdxS2k4T2dC?=
 =?utf-8?B?VTlPZ0s3SjFXYjBlcFROdzEwanZ1aHVGcGhYYzg4QzJkaXRDOGFDQ0VZMkpC?=
 =?utf-8?B?VEljYnBRSWhObjV3c1ZmNFRrNjdwcjJ3Q3pGNlQ2RmtoZGdvV3o1WDdBVFl4?=
 =?utf-8?B?ekUvMHhPaFl2UU4vMTYzRzBDV0R1WjJ6ZitPVkxBNTBrQnVEZFY1dkVTVHBX?=
 =?utf-8?B?MGxLMS9LLzBzM0FuSE9zQUZxbWp3c3h6YWtuWjVXdm9wV2RLa3RJZENoZEJw?=
 =?utf-8?B?ODBSQXc1OVdGUFJ0Q0ttbms3SFJPMGxTeHR4N3pqaHpGb0xIYU56a1grbDlP?=
 =?utf-8?B?MTRKVzdqcy9SSC9jelMwQThmZkRYb2tGb1hReFJ6b3VkYjBKQlRDb3l4eEZt?=
 =?utf-8?B?cENGSDFDQ2ZtWEIxeVpXcGplczhaYTYyblR5UnRUaVNtMzY1UU1vT1RFYTlF?=
 =?utf-8?B?U3lHelgyK3JzSDVPYnF3VTZEMTRMYm9lZ0pSN0tFNzB3WW1sNmNhdzI4YWlF?=
 =?utf-8?B?Tk9NQm14Si9WaUdHakhMQkN0WVdkbkN5NDFLREpuR1prQW1Eb2JySkZmM2hx?=
 =?utf-8?B?Z1crRmk0bUN0RTIrcnpXc1Azend0MVVsbFVIbUxicEtaakhWOWpBWUxIa2lJ?=
 =?utf-8?B?aXIwWUVHcUprM3R6NkdjUFVpWk00cFJOMk5Cc0pjVGt1M1Brdk0xa25HZHRi?=
 =?utf-8?B?K3hLNExMYlB0dFN3SklJSUM4blNxNW9ialpzOHVyYVhwNjMvSFpuRzBlaWNJ?=
 =?utf-8?B?aUJzbmZGVnpaQVVWc3RycE9EVGJsaHJoZzNGUXQzNlFocFhKSXlhYk01MUdP?=
 =?utf-8?B?U1JnNmVYTEtwTStiZ0NZTzdYUU5MK2NJNFhJbnlwR2lURzhVNG42YWVCdklw?=
 =?utf-8?B?aDNjcEROUC9uV3RsbnpQMG4xSlVrTk9mQUZEeHhHTFhtZE81SURmTmRWR2ZN?=
 =?utf-8?B?M3Q5R0w1VGRkTzdMU3p0OHB0MGNNN0s3ZDlNdStsNW9abkpHMVo3QWhNVnRY?=
 =?utf-8?B?Z1ZGS1FLQktQM3RZNmc4bHBQR3Q5MXR4ZVluL0lUUllBSUNlYm5Gdk1oNXR3?=
 =?utf-8?B?QVFqMXkrWlEzY1VSZTZsUzk1eGNWaUhPUlpOKzJJY2R2d1FCcDBSM2QrUFF4?=
 =?utf-8?B?cklORGhzVUFVR0ZpRXBTZWp1NDVwM3BNaEhEN1dQdk9QK3dXRDJBZHpmZW10?=
 =?utf-8?B?N0t5WjNOQ2txakRxRjcwSXVJRE04SWpEUDVXMWtTVloyWTJpQVZPZ21jUkhC?=
 =?utf-8?B?RVlZcitzOEZkZGFpLzZvTDgydlVlTU5yUmhCTWdDYW9tSVBlaGtvcnZpajJR?=
 =?utf-8?B?alhYSlhjczcwa1dBSjUxbFlsVU1nNmVCQXplcDBkTzFRVHVHU2ZiUWJDOVNs?=
 =?utf-8?B?NmlOc0xabHNPUTdSODBvMGJ3ZWkrNDNBemgvUnFxZ3A2NWdaczhodzUvMXZF?=
 =?utf-8?B?VFlNUm5tVFR5ZVpWRnd3aW9tYklRWE1uL3dYcE9mTThFM3FYYTVwTXdUZTlS?=
 =?utf-8?B?anNSN0h1b3VZdytDdm83eVBjRUdtNnNZNkZxVnc4Nk5yMGUyTG9BamhmRkln?=
 =?utf-8?Q?o97jhXRRPDmT3?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60d8c243-09d7-4a49-a324-08d93af4d195
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5136.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2021 11:55:41.3506 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jeAUQSPj5aAodLwKWXBbqypbRsrhji7xh1oMyq7vKioMiAHrLFfrXMOOlDVZAAyFhvU88MR7bmqCXKtmdWIpmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5294
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
Cc: Felix.Kuehling@amd.com, Christian.Koenig@amd.com,
 amd-gfx@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SGkgQ2hyaXN0aWFuLAoKCkNvdWxkIHlvdSBwbGVhc2UgcGlja8KgIHRoaXMgdXAgZm9yIGRybS1t
aXNjLW5leHQgb3IgZml4ZXMgPwoKClJlZ2FyZHMsCgpOaXJtb3kKCk9uIDYvMjkvMjAyMSAxOjQ0
IFBNLCBOaXJtb3kgRGFzIHdyb3RlOgo+IFJldHVybiBlYXJseSBmb3Igbm9uLVRUTV9QTF9UVCBC
T3Mgc28gdGhhdCB3ZSBkb24ndCBwYXNzCj4gd3JvbmcgcG9pbnRlciB0byBhbWRncHVfZ3R0X21n
cl9oYXNfZ2FydF9hZGRyKCkgd2hpY2ggYXNzdW1lcwo+IHR0bV9yZXNvdXJjZSBhcmd1bWVudCB0
byBiZSBUVE1fUExfVFQgdHlwZSBCTydzLgo+Cj4gdjM6IHJlbW92ZSBleHRyYSBicmFjZXMuCj4g
djI6IG1lcmdlIGlmLWNvbmRpdGlvbnMuCj4KPiBTaWduZWQtb2ZmLWJ5OiBOaXJtb3kgRGFzIDxu
aXJtb3kuZGFzQGFtZC5jb20+Cj4gUmV2aWV3ZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlz
dGlhbi5rb2VuaWdAYW1kLmNvbT4KPiAtLS0KPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV90dG0uYyB8IDMgKystCj4gICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCsp
LCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X3R0bS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3R0bS5j
Cj4gaW5kZXggYjQ2NzI2ZTQ3YmNlLi43YTgyZTdiOWUxOGUgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3R0bS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X3R0bS5jCj4gQEAgLTkyNiw3ICs5MjYsOCBAQCBzdGF0aWMgaW50
IGFtZGdwdV90dG1fYmFja2VuZF9iaW5kKHN0cnVjdCB0dG1fZGV2aWNlICpiZGV2LAo+ICAgCSAg
ICBib19tZW0tPm1lbV90eXBlID09IEFNREdQVV9QTF9PQSkKPiAgIAkJcmV0dXJuIC1FSU5WQUw7
Cj4KPiAtCWlmICghYW1kZ3B1X2d0dF9tZ3JfaGFzX2dhcnRfYWRkcihib19tZW0pKSB7Cj4gKwlp
ZiAoYm9fbWVtLT5tZW1fdHlwZSAhPSBUVE1fUExfVFQgfHwKPiArCSAgICAhYW1kZ3B1X2d0dF9t
Z3JfaGFzX2dhcnRfYWRkcihib19tZW0pKSB7Cj4gICAJCWd0dC0+b2Zmc2V0ID0gQU1ER1BVX0JP
X0lOVkFMSURfT0ZGU0VUOwo+ICAgCQlyZXR1cm4gMDsKPiAgIAl9Cj4gLS0KPiAyLjMyLjAKPgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1h
aWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZngK
