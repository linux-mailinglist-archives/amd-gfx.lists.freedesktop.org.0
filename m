Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 699783B1AD4
	for <lists+amd-gfx@lfdr.de>; Wed, 23 Jun 2021 15:11:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEC586E8DB;
	Wed, 23 Jun 2021 13:11:42 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2042.outbound.protection.outlook.com [40.107.223.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CEFC6E8DB
 for <amd-gfx@lists.freedesktop.org>; Wed, 23 Jun 2021 13:11:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JcCpOwUySdHM2Y2y/fC7Y2WfrHlY9+BtEGBLXHMTA9N1TAFQuIMweimgpau5NFWlf4Y5+lhUxPTNwTwC9O9NCZIIUjENu1L/W5BDrpHF/e39oga4DDgRySQ0SqjDDgBRwXQaX9S6XWlvjCPbgCdkcG4e0CYkzUi9CgThW1K6uPIC9F4irmHc+ITxL4CxCrZSJjlEzY1R9hDFD2+VOjv+Fj1cTLsqa21H7g04eLlEAAQPSmIg9FC6qqeDFmy5Wjei8My9Iob+5cVlPzoPGSeYNGbs4fPt1Og4PzO73+PoxCkNX+8Nn+6h10lh/MuipJRxcQEeIfIPHJxiC6X340OgqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NjA+tDqJOZDCm1nNlBl0AqQoKy0ODrVJ/V/4BPzm020=;
 b=OdDBR/+DR/vX99/vzG093eQy8ot8nFnFjEwHVt0cvcOT7NJgVra3KXy5Wju4m7SjP8ET5SHwd5W9A0Vf0fUNpcGLKcONWYk6BHfKpHl0W9bwSz9ncyoNgstN+7EAlMYpX6eDzvAQtyPLgRAVJVmY0hly1+8UokZQx8CS2FfY+/mg1L4R8V4omRs6Lc1dtqVcdqXmUEJhSqOA8yWwIOt8+5vMPIXhImiAmLIdi2hvA4n+07slvJSkUlBpN5yAnI85deRDBEoSsLjfK8Js+iHuNDqD8aCIt05WaDfZb23bGJ0vTJl1KKnbwteXH3IoTrXvLAbJahoMTWGVw/shX1jh/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NjA+tDqJOZDCm1nNlBl0AqQoKy0ODrVJ/V/4BPzm020=;
 b=DQL91CeEV/dI759CnEQvltnR3k472j5BxFGVIAF5JYiRCNbTgu2AlVN2t9rhuBK7hYmHmLidACd25GKd+HjiyOY9Q6Uc+ZT/6OFV6lob66+H8UJQL5KFsXgqMQO+dYW7cEn2y20nUJ9Rj01nq0t9bl+aOBW2F+J8fNvLxu+ze8Y=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5136.namprd12.prod.outlook.com (2603:10b6:5:393::23)
 by DM6PR12MB5550.namprd12.prod.outlook.com (2603:10b6:5:1b6::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18; Wed, 23 Jun
 2021 13:11:37 +0000
Received: from DM4PR12MB5136.namprd12.prod.outlook.com
 ([fe80::901b:72bb:a15:2a68]) by DM4PR12MB5136.namprd12.prod.outlook.com
 ([fe80::901b:72bb:a15:2a68%4]) with mapi id 15.20.4264.019; Wed, 23 Jun 2021
 13:11:37 +0000
Subject: Re: [PATCH 2/2] drm/amdgpu: use xarray for storing pasid in vm
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 amd-gfx@lists.freedesktop.org
References: <20210623122506.7397-1-nirmoy.das@amd.com>
 <20210623122506.7397-2-nirmoy.das@amd.com>
 <f0c5f68f-8e54-c302-8f4a-b68f3898f391@gmail.com>
From: "Das, Nirmoy" <nirmoy.das@amd.com>
Message-ID: <cd285927-7cd4-1d15-e21e-568acf15c4fe@amd.com>
Date: Wed, 23 Jun 2021 15:11:32 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <f0c5f68f-8e54-c302-8f4a-b68f3898f391@gmail.com>
Content-Language: en-US
X-Originating-IP: [2003:c5:8f23:b700:999b:61ce:dd13:3b25]
X-ClientProxiedBy: PR3P192CA0024.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:102:56::29) To DM4PR12MB5136.namprd12.prod.outlook.com
 (2603:10b6:5:393::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2003:c5:8f23:b700:999b:61ce:dd13:3b25]
 (2003:c5:8f23:b700:999b:61ce:dd13:3b25) by
 PR3P192CA0024.EURP192.PROD.OUTLOOK.COM (2603:10a6:102:56::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.18 via Frontend Transport; Wed, 23 Jun 2021 13:11:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d8307ebe-64fc-43bc-4448-08d936486efa
X-MS-TrafficTypeDiagnostic: DM6PR12MB5550:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB55509482C71410B1A558A3EA8B089@DM6PR12MB5550.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4zjCQKssfGG6P9Yr3r6VtIb3NAbcvKIMo0UNFa+uP5oRpE8oQPnouB9h7aRDhl9oj5NY/J3ByANkKtb2KunMPXop2IjgETegqUe0HOw1YhICpXU/1TzRXHZngCAHG2rFXX4GzKM6SCgx0ltK/NV+Wq3rznrZeCzDZcbX6jhtR9EHxPk0+9lyPjWmDCdK4XlBVrm5muPICd+WArcelcoKiXlacv06JlCe3akN8j/9xncJFJviP0bSiP0I48+IT3dtG3V0OXpqyQ5V1FyiHxsDLLulgBRiPJ4GW5IiSFZL5cuHKmN2LHq3twWCov4jwLYPAACc/HgjfPWDommtDWK5qVKG2rmueNiu9UBpI81Keva85ucp0LUMAMULhj+Y725FWAfys4d+NrdvQaiUzU3J+uDjxk3Hu/tBz9+tja4mXPrnCYc/0p8FfZLb07jQ0EvBgQIxMWEBVy/gh+ZFKGTLgG7BlYYu2yd8AOZk4HRVm/Ft2g4AMViZvcbpoW/llmPPJNwh0TDmqoc+4Sf5lD1BSH5JP694ox1QTGQ2CT/Rx3DErVVvIq718EnuJgELR8wzjd6ZN1haek+s4xPdwOc4LMekEupl8A/p3WIN8635GMy+IVHvJM+RdgKwakt1jaE7JTMgfOCLC3jZPV/fnm6Kd4Gm6tADNHsVwjh9pXZ6IXKKETgCchm/VkkFnq9GK5jb
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5136.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39860400002)(346002)(136003)(376002)(396003)(52116002)(53546011)(8676002)(6486002)(66476007)(66946007)(36756003)(186003)(316002)(2616005)(8936002)(16526019)(66556008)(86362001)(478600001)(38100700002)(5660300002)(31696002)(66574015)(6666004)(83380400001)(31686004)(4326008)(2906002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aTBlejZGaUZsaEhPSE1vbnk3dzJuS1E1TTR4Q2RZVHNYVHpxZlNDMXh5Wktw?=
 =?utf-8?B?ZkFQL0dqd1FCb05LalZ0TnhwRkFHcmRoNTlqdTQ3MnZTQ3lnVVJod1FSK0N3?=
 =?utf-8?B?VHlpa1ZIdW1EcGc2QlBlRlFhVjc3VkxndHYxUDlmbExWbUxSVGUzb0VkTEVw?=
 =?utf-8?B?Rm5PNk4vMkY4Rk9zbzFTOW5icmh2a1JYa01tZUl6c2JDNWp0LzMwaHVpR09h?=
 =?utf-8?B?Yklpb25ycVRaOVYrbVVKblpyUFA5WFFiak8zR0dVVTRCVnpSYUFRZGFNQlFV?=
 =?utf-8?B?dlk0Ri9rZ3hHUDR1eFh6aHAweEIxUUExUTdEYmlIdU9vNWxYN1BlOXY5cWpp?=
 =?utf-8?B?SGZSb3djTUpUbTA5bU5YVm9HSFBKZlkyWkVzNDNFV1pySTRKSWZXM090Qlk2?=
 =?utf-8?B?VjZ6dDVQK2p6MGI0aThzeGNHd25PMU1oSzZhNXJiQnhqR0NPNUNXamZrV2hw?=
 =?utf-8?B?MU4zTDFPTjZIMzZsMStqL3BCNU1tbi9nL2FZNVRPL3FpK3FqK3hESExBVHFh?=
 =?utf-8?B?OVlHZmkrRS9XTDUxK2VXb2VZc05ndEw5WVovU2hLSzFVME56S2lIckRTZHVP?=
 =?utf-8?B?bVh4OTYxUWdRNU4rc2pPK0ZyalFibFV0R2ljSkpOMEtlT1oxYktuQ05JNitV?=
 =?utf-8?B?NmlzNVp6N3kwZVB0S1FGMTJhUFpjOHFKK0x6QmVVNHlhVUVQeDhjZGcxbUYx?=
 =?utf-8?B?bWtJTFJlUGZyR1hOUUpNN0YrUjM1Z2EvYVphLzY4aStQZzNjdjU3M2YreWk1?=
 =?utf-8?B?YlF2NUJVQjE5b2V0UHRZMHRhUFFscjZIbmY0eUpkREJsYmF3MDg0b0Q0QUZQ?=
 =?utf-8?B?dXZBTWFScXpEUHI4K1JLenJpTTJRVFFFT01PTFFpWWVEdG1zZStBcjBRbnpM?=
 =?utf-8?B?VlAxUFlrcGVldjZJVnI3VnY3dTU2OEpRd0FWUWoycTJ5VDRjcjRsYWJBNDNq?=
 =?utf-8?B?cXF3dnJqSmp3MHcwcS83UXZ1UkQrdUZzKzhGTEl2bnpPaXFrTEE5ZHE1Wisr?=
 =?utf-8?B?TVNmbGswQ3d0Q3dOdnllQ2cwL3FoWXV2Z0hNMW04b280K09UQ1BKR2c2QjFU?=
 =?utf-8?B?eEVPYkhkcGVmenlDOFZzL3JuU2JUMmp1Zkt5UExQVm14WnVlNEV0bjBoL2FD?=
 =?utf-8?B?Z1BBNkh4NUVDR3kxRWd1cGV6dzNzMTJtYm5UZUhTZ2lNM0tCNGdYOGNZR1pB?=
 =?utf-8?B?cmU0MFBBYTZZWnN1K0w2L0ZSSDJLOC91OEp0RUwxb25QejNQWVJpNFowQS9h?=
 =?utf-8?B?dWZ6bmd2amNrUDcvL25PQ2I2Ti9VQWpCTW5KWUtpNSsvSHhBTHR6OVRCeDlh?=
 =?utf-8?B?Y29tZFVIWHNRUmRocWlqRHBpRWhROThjbTAxdnE2cnk4WFFxOE0ra0lOT0ZY?=
 =?utf-8?B?cjM3b2pBSDlDc0dqUy90dGlPbit6SlFYR0pWaWluMUYvOXV5L1RGOVV2T1hE?=
 =?utf-8?B?d0U3UkN0dHVTOFN4Q09FZGN6U0h4ZlhHdVpmT0VCV2VYd0xtOCtCWU9uNHBO?=
 =?utf-8?B?bFpiTU92V1A3SXAxMlkrTDUvbWV3cFVHOHgvRHhUd1dvUnhqNXA2M2JnbkpX?=
 =?utf-8?B?S05oZ1AxNVlSYi9SSHlzUE41UUdFWGhJV2NJR3orbVVRL2hQTDNyNThzRWRW?=
 =?utf-8?B?RnZkM1pJTWxPOVNCU0I3Tm80MWZRb3pETFpzN2lVdVVsc0JtOWlPYTk4MzR2?=
 =?utf-8?B?YUUvNkVLK3BCNC9IK1ZpR1BkYnJKN1NZSEVYZ2NXTE1sOVp5KzMvMWFLRHhh?=
 =?utf-8?B?UGo1OGRGSExXbWRocHp2ajdRRG55aFdaQjRkKzkvZU5SN1NDMGtOdDdmVDJo?=
 =?utf-8?B?QTlZNzN4MUp6SEk0TDhPSS85NTJOM2lvVlRLTjJTUDFGazY2elNTeS8xWUI3?=
 =?utf-8?Q?iJASW3Zel0DLd?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8307ebe-64fc-43bc-4448-08d936486efa
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5136.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2021 13:11:37.8938 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4DRRE/1Pn1UckUgZ4EZ7kkdkAArhobxF6JxAuI7T589SW34+uh2ZEfkEhrwQgp1cNUgO0FPpvjyjbNJJP3Ti8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB5550
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
Cc: Felix.Kuehling@amd.com, Christian.Koenig@amd.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Ck9uIDYvMjMvMjAyMSAyOjUwIFBNLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3RlOgo+Cj4KPiBBbSAy
My4wNi4yMSB1bSAxNDoyNSBzY2hyaWViIE5pcm1veSBEYXM6Cj4+IFJlcGxhY2UgaWRyIHdpdGgg
eGFycmF5IGFzIHdlIGFjdHVhbGx5IG5lZWQgaGFzaCBmdW5jdGlvbmFsaXR5Lgo+PiBDbGVhbnVw
IGNvZGUgcmVsYXRlZCB0byB2bSBwYXNpZCBieSBhZGRpbmcgaGVscGVyIGZ1bmN0aW9uLgo+Pgo+
PiBTaWduZWQtb2ZmLWJ5OiBOaXJtb3kgRGFzIDxuaXJtb3kuZGFzQGFtZC5jb20+Cj4+IC0tLQo+
PiDCoCBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdm0uYyB8IDEzNCArKysrKysr
KysrKy0tLS0tLS0tLS0tLS0tCj4+IMKgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV92bS5oIHzCoMKgIDMgKy0KPj4gwqAgMiBmaWxlcyBjaGFuZ2VkLCA2MCBpbnNlcnRpb25zKCsp
LCA3NyBkZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV92bS5jIAo+PiBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV92bS5jCj4+IGluZGV4IGJlODQxZDYyYTFkNC4uZTA0N2U1NmE0YmUyIDEwMDY0NAo+PiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdm0uYwo+PiArKysgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdm0uYwo+PiBAQCAtODcsNiArODcsMzkgQEAgc3Ry
dWN0IGFtZGdwdV9wcnRfY2Igewo+PiDCoMKgwqDCoMKgIHN0cnVjdCBkbWFfZmVuY2VfY2IgY2I7
Cj4+IMKgIH07Cj4+IMKgICtzdGF0aWMgaW50IGFtZGdwdV92bV9zZXRfcGFzaWQoc3RydWN0IGFt
ZGdwdV9kZXZpY2UgKmFkZXYsCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgc3RydWN0IGFtZGdwdV92bSAqdm0sCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgdW5zaWduZWQgbG9uZyBwYXNpZCkKPgo+IFNvbWUga2VybmVsZG9jIHBsZWFzZSBk
ZXNjcmliaW5nIHdoeSB3ZSBoYXZlIHRoYXQgZnVuY3Rpb24uCgoKQWxyaWdodC4KCgo+Cj4+ICt7
Cj4+ICvCoMKgwqAgdW5zaWduZWQgbG9uZyBmbGFnczsKPj4gK8KgwqDCoCBpbnQgcjsKPj4gKwo+
PiArwqDCoMKgIGlmIChwYXNpZCkgewo+Cj4gWW91IHNob3VsZCBwcm9iYWJseSByZW9yZGVyIHRo
ZSBjb2RlIHNvIHRoYXQgdGhlIG9sZCBwYXNpZCBpcyBmaXJzdCAKPiByZW1vdmVkIGFuZCB0aGVu
IGV2ZW50dWFsbHkgdGhlIG5ldyBvbmUgYWRkZWQuCj4KPj4gKyB4YV9sb2NrX2lycXNhdmUoJmFk
ZXYtPnZtX21hbmFnZXIucGFzaWRzLCBmbGFncyk7Cj4+ICvCoMKgwqDCoMKgwqDCoCByID0geGFf
ZXJyKF9feGFfc3RvcmUoJmFkZXYtPnZtX21hbmFnZXIucGFzaWRzLCBwYXNpZCwgdm0sCj4+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgR0ZQX0FUT01JQykpOwo+
PiArwqDCoMKgwqDCoMKgwqAgeGFfdW5sb2NrX2lycXJlc3RvcmUoJmFkZXYtPnZtX21hbmFnZXIu
cGFzaWRzLCBmbGFncyk7Cj4KPiBBcyBmYXIgYXMgSSBjYW4gc2VlIHRoaXMgY2FuIGp1c3QgdXNl
IHhhX3N0b3JlKCkgd2hpY2ggYWxzbyBkcm9wcyB0aGUgCj4gbmVlZCBmb3IgR0ZQX0FUT01JQyBo
ZXJlLgoKCkRvIHdlIG5lZWQgdG8gaGF2ZSB0aGlzIGlycXNhdmUvcmVzdG9yZSB0byBrZWVwIHBh
c3NpZHMgc2FmZSBmb3IgCmFtZGdwdV92bV9oYW5kbGVfZmF1bHQoKSA/Cgp4YV9zdG9yZSgpIHRh
a2VzIHRoZSBzcGlubG9jayB3aXRob3V0IGlycSBmbGFncyBzbyBJIHdhbnRlZCB0byBrZWVwIG9s
ZCAKYmVoYXZpb3IuCgoKPgo+PiArwqDCoMKgwqDCoMKgwqAgaWYgKHIgPCAwKQo+PiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gcjsKPj4gK8KgwqDCoCB9IGVsc2Ugewo+PiArwqDCoMKg
wqDCoMKgwqAgdW5zaWduZWQgbG9uZyBpbmRleDsKPj4gK8KgwqDCoMKgwqDCoMKgIHN0cnVjdCBh
bWRncHVfdm0gKnJlczsKPj4gKwo+PiArwqDCoMKgwqDCoMKgwqAgeGFfbG9ja19pcnFzYXZlKCZh
ZGV2LT52bV9tYW5hZ2VyLnBhc2lkcywgZmxhZ3MpOwo+PiArwqDCoMKgwqDCoMKgwqAgeGFfZm9y
X2VhY2goJmFkZXYtPnZtX21hbmFnZXIucGFzaWRzLCBpbmRleCwgcmVzKSB7Cj4+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIGlmIChyZXMgPT0gdm0pIHsKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBfX3hhX2VyYXNlKCZhZGV2LT52bV9tYW5hZ2VyLnBhc2lkcywgaW5kZXgpOwo+
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGJyZWFrOwo+PiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCB9Cj4+ICvCoMKgwqDCoMKgwqDCoCB9Cj4+ICvCoMKgwqDCoMKgwqDCoCB4YV91
bmxvY2tfaXJxcmVzdG9yZSgmYWRldi0+dm1fbWFuYWdlci5wYXNpZHMsIGZsYWdzKTsKPgo+IFRo
YXQgaXMgcmVhbGx5IHVnbHksIHdoeSBpcyB0aGF0IG5lY2Vzc2FyeT8KCkRvIHlvdSBtZWFuIHRo
ZSBsb2NrIGFyb3VuZCB4YV9mb3JfZWFjaCgpID8gSSB0aGluayBJIGNhbiBqdXN0IHVzZWQgbG9j
ayAKYXJvdW5kIF9feGFfZXJhc2UoKSBvciBqdXN0IHhhX2VyYXNlKCkgaWYganVzdCBzaW1wbGUg
c3BpbmxvY2sgd2l0aG91dCAKZmxhZ3MgaXMgZW5vdWdoLgoKClJlZ2FyZHMsCgpOaXJtb3kKCgo+
Cj4gQ2hyaXN0aWFuCj4KPj4gK8KgwqDCoCB9Cj4+ICsKPj4gK8KgwqDCoCB2bS0+cGFzaWQgPSBw
YXNpZDsKPj4gKwo+PiArwqDCoMKgIHJldHVybiAwOwo+PiArfQo+PiArCj4+IMKgIC8qCj4+IMKg
wqAgKiB2bSBldmljdGlvbl9sb2NrIGNhbiBiZSB0YWtlbiBpbiBNTVUgbm90aWZpZXJzLiBNYWtl
IHN1cmUgbm8gCj4+IHJlY2xhaW0tRlMKPj4gwqDCoCAqIGhhcHBlbnMgd2hpbGUgaG9sZGluZyB0
aGlzIGxvY2sgYW55d2hlcmUgdG8gcHJldmVudCBkZWFkbG9ja3Mgd2hlbgo+PiBAQCAtMjk0MCwx
OCArMjk3Myw5IEBAIGludCBhbWRncHVfdm1faW5pdChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRl
diwgCj4+IHN0cnVjdCBhbWRncHVfdm0gKnZtLCB1MzIgcGFzaWQpCj4+IMKgIMKgwqDCoMKgwqAg
YW1kZ3B1X2JvX3VucmVzZXJ2ZSh2bS0+cm9vdC5ibyk7Cj4+IMKgIC3CoMKgwqAgaWYgKHBhc2lk
KSB7Cj4+IC3CoMKgwqDCoMKgwqDCoCB1bnNpZ25lZCBsb25nIGZsYWdzOwo+PiAtCj4+IC3CoMKg
wqDCoMKgwqDCoCBzcGluX2xvY2tfaXJxc2F2ZSgmYWRldi0+dm1fbWFuYWdlci5wYXNpZF9sb2Nr
LCBmbGFncyk7Cj4+IC3CoMKgwqDCoMKgwqDCoCByID0gaWRyX2FsbG9jKCZhZGV2LT52bV9tYW5h
Z2VyLnBhc2lkX2lkciwgdm0sIHBhc2lkLCBwYXNpZCAKPj4gKyAxLAo+PiAtwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBHRlBfQVRPTUlDKTsKPj4gLSBzcGluX3VubG9ja19pcnFy
ZXN0b3JlKCZhZGV2LT52bV9tYW5hZ2VyLnBhc2lkX2xvY2ssIGZsYWdzKTsKPj4gLcKgwqDCoMKg
wqDCoMKgIGlmIChyIDwgMCkKPj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZ290byBlcnJvcl9m
cmVlX3Jvb3Q7Cj4+IC0KPj4gLcKgwqDCoMKgwqDCoMKgIHZtLT5wYXNpZCA9IHBhc2lkOwo+PiAt
wqDCoMKgIH0KPj4gK8KgwqDCoCByID0gYW1kZ3B1X3ZtX3NldF9wYXNpZChhZGV2LCB2bSwgcGFz
aWQpOwo+PiArwqDCoMKgIGlmIChyKQo+PiArwqDCoMKgwqDCoMKgwqAgZ290byBlcnJvcl9mcmVl
X3Jvb3Q7Cj4+IMKgIMKgwqDCoMKgwqAgSU5JVF9LRklGTyh2bS0+ZmF1bHRzKTsKPj4gwqAgQEAg
LTMwMzksMTggKzMwNjMsMTEgQEAgaW50IGFtZGdwdV92bV9tYWtlX2NvbXB1dGUoc3RydWN0IAo+
PiBhbWRncHVfZGV2aWNlICphZGV2LCBzdHJ1Y3QgYW1kZ3B1X3ZtICp2bSwKPj4gwqDCoMKgwqDC
oCBpZiAocikKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIGdvdG8gdW5yZXNlcnZlX2JvOwo+PiDCoCAt
wqDCoMKgIGlmIChwYXNpZCkgewo+PiAtwqDCoMKgwqDCoMKgwqAgdW5zaWduZWQgbG9uZyBmbGFn
czsKPj4gLQo+PiAtwqDCoMKgwqDCoMKgwqAgc3Bpbl9sb2NrX2lycXNhdmUoJmFkZXYtPnZtX21h
bmFnZXIucGFzaWRfbG9jaywgZmxhZ3MpOwo+PiAtwqDCoMKgwqDCoMKgwqAgciA9IGlkcl9hbGxv
YygmYWRldi0+dm1fbWFuYWdlci5wYXNpZF9pZHIsIHZtLCBwYXNpZCwgcGFzaWQgCj4+ICsgMSwK
Pj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgR0ZQX0FUT01JQyk7Cj4+IC0g
c3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgmYWRldi0+dm1fbWFuYWdlci5wYXNpZF9sb2NrLCBmbGFn
cyk7Cj4+IC0KPj4gLcKgwqDCoMKgwqDCoMKgIGlmIChyID09IC1FTk9TUEMpCj4+IC3CoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIGdvdG8gdW5yZXNlcnZlX2JvOwo+PiAtwqDCoMKgwqDCoMKgwqAgciA9
IDA7Cj4+IC3CoMKgwqAgfQo+PiArwqDCoMKgIC8qIHJlbW92ZSBwcmV2aW91cyB7cGFzaWQ6dm19
IGVudHJ5IGZpcnN0ICovCj4+ICvCoMKgwqAgciA9IGFtZGdwdV92bV9zZXRfcGFzaWQoYWRldiwg
dm0sIDApOwo+PiArwqDCoMKgIHIgPSBhbWRncHVfdm1fc2V0X3Bhc2lkKGFkZXYsIHZtLCBwYXNp
ZCk7Cj4+ICvCoMKgwqAgaWYgKHIpCj4+ICvCoMKgwqDCoMKgwqDCoCBnb3RvIHVucmVzZXJ2ZV9i
bzsKPj4gwqAgwqDCoMKgwqDCoCAvKiBDaGVjayBpZiBQRCBuZWVkcyB0byBiZSByZWluaXRpYWxp
emVkIGFuZCBkbyBpdCBiZWZvcmUKPj4gwqDCoMKgwqDCoMKgICogY2hhbmdpbmcgYW55IG90aGVy
IHN0YXRlLCBpbiBjYXNlIGl0IGZhaWxzLgo+PiBAQCAtMzA2MSw3ICszMDc4LDcgQEAgaW50IGFt
ZGdwdV92bV9tYWtlX2NvbXB1dGUoc3RydWN0IGFtZGdwdV9kZXZpY2UgCj4+ICphZGV2LCBzdHJ1
Y3QgYW1kZ3B1X3ZtICp2bSwKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIHRvX2FtZGdwdV9ib192bSh2bS0+cm9vdC5ibyksCj4+IMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBmYWxzZSk7Cj4+IMKgwqDCoMKg
wqDCoMKgwqDCoCBpZiAocikKPj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZ290byBmcmVlX2lk
cjsKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZ290byBmcmVlX3Bhc2lkX2VudHJ5Owo+PiDC
oMKgwqDCoMKgIH0KPj4gwqAgwqDCoMKgwqDCoCAvKiBVcGRhdGUgVk0gc3RhdGUgKi8KPj4gQEAg
LTMwNzgsNyArMzA5NSw3IEBAIGludCBhbWRncHVfdm1fbWFrZV9jb21wdXRlKHN0cnVjdCBhbWRn
cHVfZGV2aWNlIAo+PiAqYWRldiwgc3RydWN0IGFtZGdwdV92bSAqdm0sCj4+IMKgwqDCoMKgwqDC
oMKgwqDCoCByID0gYW1kZ3B1X2JvX3N5bmNfd2FpdCh2bS0+cm9vdC5ibywKPj4gwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIEFNREdQVV9GRU5DRV9PV05FUl9VTkRF
RklORUQsIHRydWUpOwo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKHIpCj4+IC3CoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIGdvdG8gZnJlZV9pZHI7Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGdv
dG8gZnJlZV9wYXNpZF9lbnRyeTsKPj4gwqAgwqDCoMKgwqDCoMKgwqDCoMKgIHZtLT51cGRhdGVf
ZnVuY3MgPSAmYW1kZ3B1X3ZtX2NwdV9mdW5jczsKPj4gwqDCoMKgwqDCoCB9IGVsc2Ugewo+PiBA
QCAtMzA4OCwzMSArMzEwNSwxNCBAQCBpbnQgYW1kZ3B1X3ZtX21ha2VfY29tcHV0ZShzdHJ1Y3Qg
Cj4+IGFtZGdwdV9kZXZpY2UgKmFkZXYsIHN0cnVjdCBhbWRncHVfdm0gKnZtLAo+PiDCoMKgwqDC
oMKgIHZtLT5sYXN0X3VwZGF0ZSA9IE5VTEw7Cj4+IMKgwqDCoMKgwqAgdm0tPmlzX2NvbXB1dGVf
Y29udGV4dCA9IHRydWU7Cj4+IMKgIC3CoMKgwqAgaWYgKHZtLT5wYXNpZCkgewo+PiAtwqDCoMKg
wqDCoMKgwqAgdW5zaWduZWQgbG9uZyBmbGFnczsKPj4gLQo+PiAtwqDCoMKgwqDCoMKgwqAgc3Bp
bl9sb2NrX2lycXNhdmUoJmFkZXYtPnZtX21hbmFnZXIucGFzaWRfbG9jaywgZmxhZ3MpOwo+PiAt
wqDCoMKgwqDCoMKgwqAgaWRyX3JlbW92ZSgmYWRldi0+dm1fbWFuYWdlci5wYXNpZF9pZHIsIHZt
LT5wYXNpZCk7Cj4+IC0gc3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgmYWRldi0+dm1fbWFuYWdlci5w
YXNpZF9sb2NrLCBmbGFncyk7Cj4+IC3CoMKgwqDCoMKgwqDCoCB2bS0+cGFzaWQgPSAwOwo+PiAt
wqDCoMKgIH0KPj4gLQo+PiDCoMKgwqDCoMKgIC8qIEZyZWUgdGhlIHNoYWRvdyBibyBmb3IgY29t
cHV0ZSBWTSAqLwo+PiBhbWRncHVfYm9fdW5yZWYoJnRvX2FtZGdwdV9ib192bSh2bS0+cm9vdC5i
byktPnNoYWRvdyk7Cj4+IMKgIC3CoMKgwqAgaWYgKHBhc2lkKQo+PiAtwqDCoMKgwqDCoMKgwqAg
dm0tPnBhc2lkID0gcGFzaWQ7Cj4+IC0KPj4gwqDCoMKgwqDCoCBnb3RvIHVucmVzZXJ2ZV9ibzsK
Pj4gwqAgLWZyZWVfaWRyOgo+PiAtwqDCoMKgIGlmIChwYXNpZCkgewo+PiAtwqDCoMKgwqDCoMKg
wqAgdW5zaWduZWQgbG9uZyBmbGFnczsKPj4gK2ZyZWVfcGFzaWRfZW50cnk6Cj4+ICvCoMKgwqAg
YW1kZ3B1X3ZtX3NldF9wYXNpZChhZGV2LCB2bSwgMCk7Cj4+IMKgIC0gc3Bpbl9sb2NrX2lycXNh
dmUoJmFkZXYtPnZtX21hbmFnZXIucGFzaWRfbG9jaywgZmxhZ3MpOwo+PiAtwqDCoMKgwqDCoMKg
wqAgaWRyX3JlbW92ZSgmYWRldi0+dm1fbWFuYWdlci5wYXNpZF9pZHIsIHBhc2lkKTsKPj4gLSBz
cGluX3VubG9ja19pcnFyZXN0b3JlKCZhZGV2LT52bV9tYW5hZ2VyLnBhc2lkX2xvY2ssIGZsYWdz
KTsKPj4gLcKgwqDCoCB9Cj4+IMKgIHVucmVzZXJ2ZV9ibzoKPj4gwqDCoMKgwqDCoCBhbWRncHVf
Ym9fdW5yZXNlcnZlKHZtLT5yb290LmJvKTsKPj4gwqDCoMKgwqDCoCByZXR1cm4gcjsKPj4gQEAg
LTMxMjgsMTQgKzMxMjgsNyBAQCBpbnQgYW1kZ3B1X3ZtX21ha2VfY29tcHV0ZShzdHJ1Y3QgCj4+
IGFtZGdwdV9kZXZpY2UgKmFkZXYsIHN0cnVjdCBhbWRncHVfdm0gKnZtLAo+PiDCoMKgICovCj4+
IMKgIHZvaWQgYW1kZ3B1X3ZtX3JlbGVhc2VfY29tcHV0ZShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAq
YWRldiwgc3RydWN0IAo+PiBhbWRncHVfdm0gKnZtKQo+PiDCoCB7Cj4+IC3CoMKgwqAgaWYgKHZt
LT5wYXNpZCkgewo+PiAtwqDCoMKgwqDCoMKgwqAgdW5zaWduZWQgbG9uZyBmbGFnczsKPj4gLQo+
PiAtwqDCoMKgwqDCoMKgwqAgc3Bpbl9sb2NrX2lycXNhdmUoJmFkZXYtPnZtX21hbmFnZXIucGFz
aWRfbG9jaywgZmxhZ3MpOwo+PiAtwqDCoMKgwqDCoMKgwqAgaWRyX3JlbW92ZSgmYWRldi0+dm1f
bWFuYWdlci5wYXNpZF9pZHIsIHZtLT5wYXNpZCk7Cj4+IC0gc3Bpbl91bmxvY2tfaXJxcmVzdG9y
ZSgmYWRldi0+dm1fbWFuYWdlci5wYXNpZF9sb2NrLCBmbGFncyk7Cj4+IC3CoMKgwqAgfQo+PiAt
wqDCoMKgIHZtLT5wYXNpZCA9IDA7Cj4+ICvCoMKgwqAgYW1kZ3B1X3ZtX3NldF9wYXNpZChhZGV2
LCB2bSwgMCk7Cj4+IMKgwqDCoMKgwqAgdm0tPmlzX2NvbXB1dGVfY29udGV4dCA9IGZhbHNlOwo+
PiDCoCB9Cj4+IMKgIEBAIC0zMTU5LDE1ICszMTUyLDcgQEAgdm9pZCBhbWRncHVfdm1fZmluaShz
dHJ1Y3QgYW1kZ3B1X2RldmljZSAKPj4gKmFkZXYsIHN0cnVjdCBhbWRncHVfdm0gKnZtKQo+PiDC
oCDCoMKgwqDCoMKgIHJvb3QgPSBhbWRncHVfYm9fcmVmKHZtLT5yb290LmJvKTsKPj4gwqDCoMKg
wqDCoCBhbWRncHVfYm9fcmVzZXJ2ZShyb290LCB0cnVlKTsKPj4gLcKgwqDCoCBpZiAodm0tPnBh
c2lkKSB7Cj4+IC3CoMKgwqDCoMKgwqDCoCB1bnNpZ25lZCBsb25nIGZsYWdzOwo+PiAtCj4+IC3C
oMKgwqDCoMKgwqDCoCBzcGluX2xvY2tfaXJxc2F2ZSgmYWRldi0+dm1fbWFuYWdlci5wYXNpZF9s
b2NrLCBmbGFncyk7Cj4+IC3CoMKgwqDCoMKgwqDCoCBpZHJfcmVtb3ZlKCZhZGV2LT52bV9tYW5h
Z2VyLnBhc2lkX2lkciwgdm0tPnBhc2lkKTsKPj4gLSBzcGluX3VubG9ja19pcnFyZXN0b3JlKCZh
ZGV2LT52bV9tYW5hZ2VyLnBhc2lkX2xvY2ssIGZsYWdzKTsKPj4gLcKgwqDCoMKgwqDCoMKgIHZt
LT5wYXNpZCA9IDA7Cj4+IC3CoMKgwqAgfQo+PiAtCj4+ICvCoMKgwqAgYW1kZ3B1X3ZtX3NldF9w
YXNpZChhZGV2LCB2bSwgMCk7Cj4+IMKgwqDCoMKgwqAgZG1hX2ZlbmNlX3dhaXQodm0tPmxhc3Rf
dW5sb2NrZWQsIGZhbHNlKTsKPj4gwqDCoMKgwqDCoCBkbWFfZmVuY2VfcHV0KHZtLT5sYXN0X3Vu
bG9ja2VkKTsKPj4gwqAgQEAgLTMyNDksOCArMzIzNCw3IEBAIHZvaWQgYW1kZ3B1X3ZtX21hbmFn
ZXJfaW5pdChzdHJ1Y3QgCj4+IGFtZGdwdV9kZXZpY2UgKmFkZXYpCj4+IMKgwqDCoMKgwqAgYWRl
di0+dm1fbWFuYWdlci52bV91cGRhdGVfbW9kZSA9IDA7Cj4+IMKgICNlbmRpZgo+PiDCoCAtwqDC
oMKgIGlkcl9pbml0KCZhZGV2LT52bV9tYW5hZ2VyLnBhc2lkX2lkcik7Cj4+IC3CoMKgwqAgc3Bp
bl9sb2NrX2luaXQoJmFkZXYtPnZtX21hbmFnZXIucGFzaWRfbG9jayk7Cj4+ICvCoMKgwqAgeGFf
aW5pdF9mbGFncygmYWRldi0+dm1fbWFuYWdlci5wYXNpZHMsIFhBX0ZMQUdTX0xPQ0tfSVJRKTsK
Pj4gwqAgfQo+PiDCoCDCoCAvKioKPj4gQEAgLTMyNjIsOCArMzI0Niw4IEBAIHZvaWQgYW1kZ3B1
X3ZtX21hbmFnZXJfaW5pdChzdHJ1Y3QgCj4+IGFtZGdwdV9kZXZpY2UgKmFkZXYpCj4+IMKgwqAg
Ki8KPj4gwqAgdm9pZCBhbWRncHVfdm1fbWFuYWdlcl9maW5pKHN0cnVjdCBhbWRncHVfZGV2aWNl
ICphZGV2KQo+PiDCoCB7Cj4+IC3CoMKgwqAgV0FSTl9PTighaWRyX2lzX2VtcHR5KCZhZGV2LT52
bV9tYW5hZ2VyLnBhc2lkX2lkcikpOwo+PiAtwqDCoMKgIGlkcl9kZXN0cm95KCZhZGV2LT52bV9t
YW5hZ2VyLnBhc2lkX2lkcik7Cj4+ICvCoMKgwqAgV0FSTl9PTigheGFfZW1wdHkoJmFkZXYtPnZt
X21hbmFnZXIucGFzaWRzKSk7Cj4+ICvCoMKgwqAgeGFfZGVzdHJveSgmYWRldi0+dm1fbWFuYWdl
ci5wYXNpZHMpOwo+PiDCoCDCoMKgwqDCoMKgIGFtZGdwdV92bWlkX21ncl9maW5pKGFkZXYpOwo+
PiDCoCB9Cj4+IEBAIC0zMzMyLDEzICszMzE2LDEzIEBAIHZvaWQgYW1kZ3B1X3ZtX2dldF90YXNr
X2luZm8oc3RydWN0IAo+PiBhbWRncHVfZGV2aWNlICphZGV2LCB1MzIgcGFzaWQsCj4+IMKgwqDC
oMKgwqAgc3RydWN0IGFtZGdwdV92bSAqdm07Cj4+IMKgwqDCoMKgwqAgdW5zaWduZWQgbG9uZyBm
bGFnczsKPj4gwqAgLcKgwqDCoCBzcGluX2xvY2tfaXJxc2F2ZSgmYWRldi0+dm1fbWFuYWdlci5w
YXNpZF9sb2NrLCBmbGFncyk7Cj4+ICvCoMKgwqAgeGFfbG9ja19pcnFzYXZlKCZhZGV2LT52bV9t
YW5hZ2VyLnBhc2lkcywgZmxhZ3MpOwo+PiDCoCAtwqDCoMKgIHZtID0gaWRyX2ZpbmQoJmFkZXYt
PnZtX21hbmFnZXIucGFzaWRfaWRyLCBwYXNpZCk7Cj4+ICvCoMKgwqAgdm0gPSB4YV9sb2FkKCZh
ZGV2LT52bV9tYW5hZ2VyLnBhc2lkcywgcGFzaWQpOwo+PiDCoMKgwqDCoMKgIGlmICh2bSkKPj4g
wqDCoMKgwqDCoMKgwqDCoMKgICp0YXNrX2luZm8gPSB2bS0+dGFza19pbmZvOwo+PiDCoCAtIHNw
aW5fdW5sb2NrX2lycXJlc3RvcmUoJmFkZXYtPnZtX21hbmFnZXIucGFzaWRfbG9jaywgZmxhZ3Mp
Owo+PiArwqDCoMKgIHhhX3VubG9ja19pcnFyZXN0b3JlKCZhZGV2LT52bV9tYW5hZ2VyLnBhc2lk
cywgZmxhZ3MpOwo+PiDCoCB9Cj4+IMKgIMKgIC8qKgo+PiBAQCAtMzM4MCwxNSArMzM2NCwxNSBA
QCBib29sIGFtZGdwdV92bV9oYW5kbGVfZmF1bHQoc3RydWN0IAo+PiBhbWRncHVfZGV2aWNlICph
ZGV2LCB1MzIgcGFzaWQsCj4+IMKgwqDCoMKgwqAgc3RydWN0IGFtZGdwdV92bSAqdm07Cj4+IMKg
wqDCoMKgwqAgaW50IHI7Cj4+IMKgIC3CoMKgwqAgc3Bpbl9sb2NrX2lycXNhdmUoJmFkZXYtPnZt
X21hbmFnZXIucGFzaWRfbG9jaywgaXJxZmxhZ3MpOwo+PiAtwqDCoMKgIHZtID0gaWRyX2ZpbmQo
JmFkZXYtPnZtX21hbmFnZXIucGFzaWRfaWRyLCBwYXNpZCk7Cj4+ICvCoMKgwqAgeGFfbG9ja19p
cnFzYXZlKCZhZGV2LT52bV9tYW5hZ2VyLnBhc2lkcywgaXJxZmxhZ3MpOwo+PiArwqDCoMKgIHZt
ID0geGFfbG9hZCgmYWRldi0+dm1fbWFuYWdlci5wYXNpZHMsIHBhc2lkKTsKPj4gwqDCoMKgwqDC
oCBpZiAodm0pIHsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIHJvb3QgPSBhbWRncHVfYm9fcmVmKHZt
LT5yb290LmJvKTsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIGlzX2NvbXB1dGVfY29udGV4dCA9IHZt
LT5pc19jb21wdXRlX2NvbnRleHQ7Cj4+IMKgwqDCoMKgwqAgfSBlbHNlIHsKPj4gwqDCoMKgwqDC
oMKgwqDCoMKgIHJvb3QgPSBOVUxMOwo+PiDCoMKgwqDCoMKgIH0KPj4gLcKgwqDCoCBzcGluX3Vu
bG9ja19pcnFyZXN0b3JlKCZhZGV2LT52bV9tYW5hZ2VyLnBhc2lkX2xvY2ssIGlycWZsYWdzKTsK
Pj4gK8KgwqDCoCB4YV91bmxvY2tfaXJxcmVzdG9yZSgmYWRldi0+dm1fbWFuYWdlci5wYXNpZHMs
IGlycWZsYWdzKTsKPj4gwqAgwqDCoMKgwqDCoCBpZiAoIXJvb3QpCj4+IMKgwqDCoMKgwqDCoMKg
wqDCoCByZXR1cm4gZmFsc2U7Cj4+IEBAIC0zNDA2LDExICszMzkwLDExIEBAIGJvb2wgYW1kZ3B1
X3ZtX2hhbmRsZV9mYXVsdChzdHJ1Y3QgCj4+IGFtZGdwdV9kZXZpY2UgKmFkZXYsIHUzMiBwYXNp
ZCwKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIGdvdG8gZXJyb3JfdW5yZWY7Cj4+IMKgIMKgwqDCoMKg
wqAgLyogRG91YmxlIGNoZWNrIHRoYXQgdGhlIFZNIHN0aWxsIGV4aXN0cyAqLwo+PiAtwqDCoMKg
IHNwaW5fbG9ja19pcnFzYXZlKCZhZGV2LT52bV9tYW5hZ2VyLnBhc2lkX2xvY2ssIGlycWZsYWdz
KTsKPj4gLcKgwqDCoCB2bSA9IGlkcl9maW5kKCZhZGV2LT52bV9tYW5hZ2VyLnBhc2lkX2lkciwg
cGFzaWQpOwo+PiArwqDCoMKgIHhhX2xvY2tfaXJxc2F2ZSgmYWRldi0+dm1fbWFuYWdlci5wYXNp
ZHMsIGlycWZsYWdzKTsKPj4gK8KgwqDCoCB2bSA9IHhhX2xvYWQoJmFkZXYtPnZtX21hbmFnZXIu
cGFzaWRzLCBwYXNpZCk7Cj4+IMKgwqDCoMKgwqAgaWYgKHZtICYmIHZtLT5yb290LmJvICE9IHJv
b3QpCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCB2bSA9IE5VTEw7Cj4+IC3CoMKgwqAgc3Bpbl91bmxv
Y2tfaXJxcmVzdG9yZSgmYWRldi0+dm1fbWFuYWdlci5wYXNpZF9sb2NrLCBpcnFmbGFncyk7Cj4+
ICvCoMKgwqAgeGFfdW5sb2NrX2lycXJlc3RvcmUoJmFkZXYtPnZtX21hbmFnZXIucGFzaWRzLCBp
cnFmbGFncyk7Cj4+IMKgwqDCoMKgwqAgaWYgKCF2bSkKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIGdv
dG8gZXJyb3JfdW5sb2NrOwo+PiDCoCBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X3ZtLmggCj4+IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X3ZtLmgKPj4gaW5kZXggZGRiODVhODVjYmJhLi4zMWM0Njc3NjQxNjIgMTAwNjQ0Cj4+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92bS5oCj4+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92bS5oCj4+IEBAIC0zNTksOCArMzU5LDcgQEAgc3Ry
dWN0IGFtZGdwdV92bV9tYW5hZ2VyIHsKPj4gwqDCoMKgwqDCoCAvKiBQQVNJRCB0byBWTSBtYXBw
aW5nLCB3aWxsIGJlIHVzZWQgaW4gaW50ZXJydXB0IGNvbnRleHQgdG8KPj4gwqDCoMKgwqDCoMKg
ICogbG9vayB1cCBWTSBvZiBhIHBhZ2UgZmF1bHQKPj4gwqDCoMKgwqDCoMKgICovCj4+IC3CoMKg
wqAgc3RydWN0IGlkcsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBwYXNpZF9pZHI7Cj4+
IC3CoMKgwqAgc3BpbmxvY2tfdMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBwYXNpZF9s
b2NrOwo+PiArwqDCoMKgIHN0cnVjdCB4YXJyYXnCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgcGFzaWRzOwo+PiDCoCB9Owo+PiDCoCDCoCBzdHJ1Y3QgYW1kZ3B1X2JvX3ZhX21hcHBpbmc7
Cj4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdm
eCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4Cg==
