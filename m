Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A97222D761C
	for <lists+amd-gfx@lfdr.de>; Fri, 11 Dec 2020 13:57:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B7AE6EDDD;
	Fri, 11 Dec 2020 12:57:36 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2057.outbound.protection.outlook.com [40.107.93.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BCA36EDDB;
 Fri, 11 Dec 2020 12:57:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YwscxGM9MZZ8+uNTfSCRin85JG2o3jk2C3UIH6w1lagteRB59MzAaI0vbaMaMbdR9TvXT0wXhYET+LIA0o4/2628rDq1v27W4AzrgyjXOCzTLu4IunnKdm0XSv5Ni4c0YNqGZx+/jtf3kj4RmA+7KooxO42KdTEs7ATTX4ns+Sze+XH/Eta9z7yM5ZLDygmlrlSx19pw6dwMlAMrMzP/NiF8urVJb6ZGFzKSwvqCxhzYpDMcgDTsxFGsD8v0hd5Hv8eKzgqP3DK5YFw7itPp7PZm1LyjWrmhIuoc6PzidfAMtoiSHZ3MIlBtSfP8jGqE/UnBNOy8lIDkL/A7zuQVCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ICtG5/c9bsjcxycSzG70txUqJ2sGPo8GCOdEeoyIgpg=;
 b=UByuCsGN48yC6r3W1vVCI/kQvbMcHHOs7x7X+v4xv2/S3x9IUIYyUP4pYcwNNzRSTSFvxSon5Bmde+0IrjH4+pUFVcBuCyZGeUhr4aOUFTpPP/rSU6leD4wRhXazB4uJlt6SwRLuBUH0QtDtuIuj/8H1dpRexDuCxBTOtfV31XOpCSAWjfzAimyLlQ9oF2YYSV7pfKkbanzKh7LpWvhASvmYDcTT5nOvHgyYRlEM6cVfBv6wM8YaWzqln0c6RdjUZejYC2GpU3Uo1+/KM5XGmuznQk168qLl+9RVnCU+0oop/M8LbxdXLV4DTYLYAMeF8y3p86QbeU+ZAz0IN/7irQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ICtG5/c9bsjcxycSzG70txUqJ2sGPo8GCOdEeoyIgpg=;
 b=FOKWeloKAV7kxksCNmJfIrbaX30KecU0X7g3rUIaFvi3QFQNKq0WmHkrOGbREZ01S7EhGsH7x5KEDUdYRJzvKvp2r6U38+blxqtx9NSSnohimzaUnjXN99/wfbTrhG5FCR2esAYs87EZYiJtaeK6ucDRrnqOaTG/jUgmt5GJ3v8=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4334.namprd12.prod.outlook.com (2603:10b6:208:1d1::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12; Fri, 11 Dec
 2020 12:57:31 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5%3]) with mapi id 15.20.3654.016; Fri, 11 Dec 2020
 12:57:31 +0000
Subject: Re: [PATCH v2 0/3] Experimental freesync video mode optimization
To: Pekka Paalanen <ppaalanen@gmail.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
References: <20201210184823.285415-1-aurabindo.pillai@amd.com>
 <MC46k2jDYAeDTZaSlv6T5iIq5ibkh2yYwW3KZ-XLXLwoRByjkWsEr6-6eQM4iZqmkiLoleyh84S290ytAub0bK-esJje1OGKIEilcz_iikY=@emersion.fr>
 <0b7132b8-a890-b4f0-0a0c-260015fa0bbb@amd.com>
 <20201211115549.32ade81b@eldfell>
 <53f5b48c-c2b5-ed66-0c0e-bba0b22dba03@gmail.com>
 <20201211142019.19dae2aa@eldfell>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <c262b694-fb5d-accd-2582-4adb967ea890@amd.com>
Date: Mon, 14 Dec 2020 21:57:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20201211142019.19dae2aa@eldfell>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM0PR01CA0133.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:168::38) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR01CA0133.eurprd01.prod.exchangelabs.com (2603:10a6:208:168::38) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12 via Frontend
 Transport; Fri, 11 Dec 2020 12:57:29 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 4e492308-222f-472b-443d-08d89dd452bc
X-MS-TrafficTypeDiagnostic: MN2PR12MB4334:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB4334B90B8BD27C6838DFF94883CA0@MN2PR12MB4334.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iKzLwN0yg2nZv0y6EqvvkwTDtatBjBvqL1Bk5AaYZND4yxW3P8Ls/xsTyLMYUv5B9mO02QXbUOpfjtDmphdtN7+lzuMCciQwA7OIDfJcka9VQ3+7Z18mehwmdKdgeoSvHV+4Lp0xBWtr0P+GMieAAL4oqrYDaMf4So9jFNLxbpqCgjq674Rnuf7WmURoiPllwR+LehnV9VXt4A+Uhhe6omq4Res+gOXYQye7UhwMtZTextc3eINpLfRbzeP55qmLAaOqSTjw8wAhZr5Lyh1xIIwya8GmfgAptfQiDd8lNSJgRP055ywE0j70mkBTU7bSNVaaakbe5zN7dO4T+3bZk0l4e/vWvtgD4cpEcybZv3BP663l2PnmGZ5h2pu7MsmwdVkPPmiSo55eXKAJNipOXQqPRiqxDHU9UGXjdRgMQGk1h3p58KNX1sLjocEZUZ3d
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(366004)(136003)(6666004)(31696002)(86362001)(2616005)(8936002)(5660300002)(66476007)(66556008)(31686004)(34490700003)(8676002)(36756003)(4326008)(52116002)(186003)(66946007)(16526019)(508600001)(54906003)(2906002)(53546011)(6486002)(110136005)(83380400001)(66574015)(367364002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?eDIyWG9qYkZhMDRzVzJVdEZuVmFKRlJyMm8xRlJxTy9HMWpDbTZYbjVsaXpR?=
 =?utf-8?B?V3lMMCs4RXlnOXVjcW43OXZ2TEJFeUNhVTY1WWFKNEM2UW5ENEE5UUVmSnFE?=
 =?utf-8?B?M2VFbm1lNDROZkdvNGdaYnZIbEVRdFR6dVRzbmxRUS9KTEJlOEZWMUpQSmJD?=
 =?utf-8?B?V0p3OS9zbm1ENFBzR25qNnBNSnVhdVlLVW1GOEtQOEFzTjVDQ3h0eG4rQkhE?=
 =?utf-8?B?eThWRUhaVngrVjlRMEhXZndmL3AwVkZpY1FvWVYvVGNFdFYxaHArWXdmMFpa?=
 =?utf-8?B?S3FVbjZhZGxkSjIrSXhQL2NGVEJDZ3pPK3E2Z0hVTy9nRXpxbWJHTVZIbFZU?=
 =?utf-8?B?aklxRmpXWGpSdFdZejRCMTBVTnhVTUdDeHpxOENwbSs1NHQ3UlBOYm1vQ0Zm?=
 =?utf-8?B?bzEzYUhRTVpMei84UEJnMXB1bXdwZjF2WnUyY000K2RFTDRYV1M0MDlhbFpo?=
 =?utf-8?B?dTY1VTI1azcvcnpjQzErdS9BbnJPdU51bnFqM3N2MXM3a2FxRVhEUnFNRmNy?=
 =?utf-8?B?eWp0VEZVekJaNU1TZTZxbUxNYm1JcUpvMjVzL3VKN01VVk42K3p3QXpuWGdQ?=
 =?utf-8?B?UXN1UmdJbXQ1TmQrbUxlaGlxK2xDSmxISkpJR2JhZkxsTy84bWNXY1IxZWl3?=
 =?utf-8?B?Q2NVYXFxQ01Xd0haQ1ArOXF4M0Y3dmdwWnBZRmZjVUx2T0t2WlZETTQ0RFNY?=
 =?utf-8?B?cDRpNU9kRm9HTGNSaXkxVktUSjUxLzY2YTQ0UzR5QUZpL0JiOVo3cmw0RVVz?=
 =?utf-8?B?eDRsMzZRVWcvc2hGS3M3dmQxNEVZYlJveUJYektpMkFjMlhnb0VsbExuS25j?=
 =?utf-8?B?MUxqMkk3aVliejNoNWUySHNoQWtmcXJsd24xMTEwUG1VOHBZelNlaUJadjFO?=
 =?utf-8?B?MG8rVzN3Y2ZLZzFVbnp2ZzVLL1pZMFJSb1hzM0NlRXhzWVdPRVg3S0QxNElE?=
 =?utf-8?B?NGV2RFhVb3NLdCtlZCtTL1BEOGVwMjlGQ0syaDJWSktWODBuSHVic1IvYzRw?=
 =?utf-8?B?M0FmRGs5ZndpZk9HSlhJTGYvWDRjZ29iSkhrb3ZsMmoyZWRsWk1nOXFiRkFm?=
 =?utf-8?B?SU9jeHM4SFlwSnhWU01GdW9XVzZBL05vZ3ZlenYxQzlvQzJVQUlJNXJLdUJI?=
 =?utf-8?B?eGI2WEZ6czhJUVhlcEhwcjA3WXl6VHB2bk5nVUNMU3ZGbjIwYmI1M0dUQmVu?=
 =?utf-8?B?OGtsa0N5eVM3MmNQMTFFYlhPaGIrWWg5YW92OWVPZXN1SWVBMzF0MFZ1NTdj?=
 =?utf-8?B?TnpnTjduNmp2aGI3azNKdDZKSFh5K0JiWURTc0owTWxtdzZ5OThXSVNqUW9C?=
 =?utf-8?B?WDRyaHVWWTAwekJQWFpGellFaDdmWUdlY1dpU0lYT2RwcHhFTFlyNXo3REpx?=
 =?utf-8?B?UDFqd1VUVUx5a1dlSCttZVQvMGhJWExTcVVoR1VjTnR0WFpqTGN4bFFTL0ln?=
 =?utf-8?Q?3/s6OTIg?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2020 12:57:31.7733 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e492308-222f-472b-443d-08d89dd452bc
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fK+u7MVuVzwgizxhNB3nWb6lKqoawbljaA8/TMCwYKq9mPGsIdLwcTIQF0V9CFst
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4334
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
Cc: stylon.wang@amd.com, thong.thai@amd.com, Simon Ser <contact@emersion.fr>,
 Shashank Sharma <shashank.sharma@amd.com>, amd-gfx@lists.freedesktop.org,
 Martin Peres <martin.peres@free.fr>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 DRI Development <dri-devel@lists.freedesktop.org>, wayne.lin@amd.com,
 alexander.deucher@amd.com, Harry.Wentland@amd.com, nicholas.kazlauskas@amd.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QW0gMTEuMTIuMjAgdW0gMTM6MjAgc2NocmllYiBQZWtrYSBQYWFsYW5lbjoKPiBPbiBGcmksIDEx
IERlYyAyMDIwIDExOjI4OjM2ICswMTAwCj4gQ2hyaXN0aWFuIEvDtm5pZyA8Y2tvZW5pZy5sZWlj
aHR6dW1lcmtlbkBnbWFpbC5jb20+IHdyb3RlOgo+Cj4+IEFtIDExLjEyLjIwIHVtIDEwOjU1IHNj
aHJpZWIgUGVra2EgUGFhbGFuZW46Cj4+PiBPbiBGcmksIDExIERlYyAyMDIwIDA5OjU2OjA3ICsw
NTMwCj4+PiBTaGFzaGFuayBTaGFybWEgPHNoYXNoYW5rLnNoYXJtYUBhbWQuY29tPiB3cm90ZToK
Pj4+ICAgCj4+Pj4gSGVsbG8gU2ltb24sCj4+Pj4KPj4+PiBIb3BlIHlvdSBhcmUgZG9pbmcgd2Vs
bCwKPj4+Pgo+Pj4+IEkgd2FzIGhlbHBpbmcgb3V0IEF1cmFiaW5kbyBhbmQgdGhlIHRlYW0gd2l0
aCB0aGUgZGVzaWduLCBzbyBJIGhhdmUKPj4+PiB0YWtlbiB0aGUgbGliZXJ0eSBvZiBhZGRpbmcg
c29tZSBjb21tZW50cyBvbiBiZWhhbGYgb2YgdGhlIHRlYW0sCj4+Pj4gSW5saW5lLgo+Pj4+Cj4+
Pj4gT24gMTEvMTIvMjAgMzozMSBhbSwgU2ltb24gU2VyIHdyb3RlOgo+Pj4+PiBIaSwKPj4+Pj4K
Pj4+Pj4gKENDIGRyaS1kZXZlbCwgUGVra2EgYW5kIE1hcnRpbiB3aG8gbWlnaHQgYmUgaW50ZXJl
c3RlZCBpbiB0aGlzIGFzCj4+Pj4+IHdlbGwuKQo+Pj4gVGhhbmtzIGZvciB0aGUgQ2MhIFRoaXMg
aXMgdmVyeSBpbnRlcmVzdGluZyB0byBtZSwgYW5kIGJlY2F1c2UgaXQgd2FzCj4+PiBub3QgQ2Mn
ZCB0byBkcmktZGV2ZWxAIG9yaWdpbmFsbHksIEkgd291bGQgaGF2ZSBtaXNzZWQgdGhpcyBvdGhl
cndpc2UuCj4+PiAgIAo+Pj4+PiBPbiBUaHVyc2RheSwgRGVjZW1iZXIgMTB0aCwgMjAyMCBhdCA3
OjQ4IFBNLCBBdXJhYmluZG8gUGlsbGFpIDxhdXJhYmluZG8ucGlsbGFpQGFtZC5jb20+IHdyb3Rl
Ogo+Pj4+PiAgICAgIAo+Pj4+Pj4gVGhpcyBwYXRjaHNldCBlbmFibGVzIGZyZWVzeW5jIHZpZGVv
IG1vZGUgdXNlY2FzZSB3aGVyZSB0aGUgdXNlcnNwYWNlCj4+Pj4+PiBjYW4gcmVxdWVzdCBhIGZy
ZWVzeW5jIGNvbXBhdGlibGUgdmlkZW8gbW9kZSBzdWNoIHRoYXQgc3dpdGNoaW5nIHRvIHRoaXMK
Pj4+Pj4+IG1vZGUgZG9lcyBub3QgdHJpZ2dlciBibGFua2luZy4KPj4+Pj4+Cj4+Pj4+PiBUaGlz
IGZlYXR1cmUgaXMgZ3VhcmRlZCBieSBhIG1vZHVsZSBwYXJhbWV0ZXIgd2hpY2ggaXMgZGlzYWJs
ZWQgYnkKPj4+Pj4+IGRlZmF1bHQuIEVuYWJsaW5nIHRoaXMgcGFyYW10ZXJzIGFkZHMgYWRkaXRp
b25hbCBtb2RlcyB0byB0aGUgZHJpdmVyCj4+Pj4+PiBtb2RlbGlzdCwgYW5kIGFsc28gZW5hYmxl
cyB0aGUgb3B0aW1pemF0aW9uIHRvIHNraXAgbW9kZXNldCB3aGVuIHVzaW5nCj4+Pj4+PiBvbmUg
b2YgdGhlc2UgbW9kZXMuCj4+Pj4+IFRoYW5rcyBmb3Igd29ya2luZyBvbiB0aGlzLCBpdCdzIGFu
IGludGVyZXN0aW5nIGZlYXR1cmUhIEhvd2V2ZXIgSSdkIGxpa2UgdG8KPj4+Pj4gdGFrZSBzb21l
IHRpbWUgdG8gdGhpbmsgYWJvdXQgdGhlIHVzZXItc3BhY2UgQVBJIGZvciB0aGlzLgo+Pj4+Pgo+
Pj4+PiBBcyBJIHVuZGVyc3RhbmQgaXQsIHNvbWUgbmV3IHN5bnRoZXRpYyBtb2RlcyBhcmUgYWRk
ZWQsIGFuZCB1c2VyLXNwYWNlIGNhbgo+Pj4+PiBwZXJmb3JtIGEgdGVzdC1vbmx5IGF0b21pYyAq
d2l0aG91dCogQUxMT1dfTU9ERVNFVCB0byBmaWd1cmUgb3V0IHdoZXRoZXIgaXQgY2FuCj4+Pj4+
IHN3aXRjaCB0byBhIG1vZGUgd2l0aG91dCBibGFua2luZyB0aGUgc2NyZWVuLgo+Pj4+IFRoZSBp
bXBsZW1lbnRhdGlvbiBpcyBpbiB0aG9zZSBsaW5lcywgYnV0IGEgYml0IGRpZmZlcmVudC4gVGhl
IGlkZWEKPj4+PiBpcyB0bzoKPj4+Pgo+Pj4+IC0gY2hlY2sgaWYgdGhlIG1vbml0b3Igc3VwcG9y
dHMgVlJSLAo+Pj4+Cj4+Pj4gLSBJZiBpdCBkb2VzLCBhZGQgc29tZSBuZXcgbW9kZXMgd2hpY2gg
YXJlIGluIHRoZSBWUlIgdG9sZXJhbmNlCj4+Pj4gcmFuZ2UsIGFzIG5ldyB2aWRlbyBtb2RlcyBp
biB0aGUgbGlzdCAod2l0aCBkcml2ZXIgZmxhZykuCj4+Pj4KPj4+PiAtIHdoZW4geW91IGdldCBt
b2Rlc2V0IG9uIGFueSBvZiB0aGVzZSBtb2Rlcywgc2tpcCB0aGUgZnVsbCBtb2Rlc2V0LAo+Pj4+
IGFuZCBqdXN0IGFkanVzdCB0aGUgZnJvbnRfcG9yY2ggdGltaW5nCj4+Pj4KPj4+PiBzbyB0aGV5
IGFyZSBub3QgdGVzdC1vbmx5IGFzIHN1Y2gsIGZvciBhbnkgdXNlci1zcGFjZSB0aGVzZSBtb2Rl
cwo+Pj4+IHdpbGwgYmUgYXMgcmVhbCBhcyBhbnkgb3RoZXIgcHJvYmVkIG1vZGVzIG9mIHRoZSBs
aXN0Lgo+Pj4gQnV0IGlzIGl0IHdvcnRoIHRvIGFsbG93IGEgbW9kZXNldCB0byBiZSBnbGl0Y2gt
ZnJlZSBpZiB0aGUgdXNlcnNwYWNlCj4+PiBkb2VzIG5vdCBrbm93IHRoZXkgYXJlIGdsaXRjaC1m
cmVlPyBJIHRoaW5rIGlmIHRoaXMgaXMgZ29pbmcgaW4sIGl0Cj4+PiB3b3VsZCBiZSByZWFsbHkg
dXNlZnVsIHRvIGdpdmUgdGhlIGd1YXJhbnRlZXMgdG8gdXNlcnNwYWNlIGV4cGxpY2l0bHksCj4+
PiBhbmQgbm90IGxlYXZlIHRoaXMgZmVhdHVyZSBhdCBhbiAiYWNjaWRlbnRhbGx5IG5vIGdsaXRj
aCBzb21ldGltZXMiCj4+PiBsZXZlbC4KPj4+Cj4+Pgo+Pj4gSSBoYXZlIGJlZW4gZXhwZWN0aW5n
IGFuZCBob3BpbmcgZm9yIHRoZSBhYmlsaXR5IHRvIGNoYW5nZSB2aWRlbyBtb2RlCj4+PiB0aW1p
bmdzIHdpdGhvdXQgYSBtb2Rlc2V0IGV2ZXIgc2luY2UgSSBsZWFybnQgdGhhdCBWUlIgaXMgYWJv
dXQKPj4+IGZyb250LXBvcmNoIGFkanVzdG1lbnQsIHF1aXRlIGEgd2hpbGUgYWdvLgo+Pj4KPj4+
IFRoaXMgaXMgaG93IEkgZW52aXNpb24gdXNlcnNwYWNlIG1ha2luZyB1c2Ugb2YgaXQ6Cj4+Pgo+
Pj4gTGV0IHVzIGhhdmUgYSBXYXlsYW5kIGNvbXBvc2l0b3IsIHdoaWNoIHVzZXMgZml4ZWQtZnJl
cXVlbmN5IHZpZGVvCj4+PiBtb2RlcywgYmVjYXVzZSBpdCB3YW50cyBwcmVkaWN0YWJsZSB2Ymxh
bmsgY3ljbGVzLiBJT1csIGl0IHdpbGwgbm90Cj4+PiBlbmFibGUgVlJSIGFzIHN1Y2guCj4+IFdl
bGwgaW4gZ2VuZXJhbCBwbGVhc2Uga2VlcCBpbiBtaW5kIHRoYXQgdGhpcyBpcyBqdXN0IGEgc2hv
cnQgdGVybQo+PiBzb2x1dGlvbiBmb3IgWDExIGFwcGxpY2F0aW9ucy4KPiBJIGd1ZXNzIHNvbWVv
bmUgc2hvdWxkIGhhdmUgbWVudGlvbmVkIHRoYXQuIDotKQo+Cj4gRG8gd2UgcmVhbGx5IHdhbnQg
dG8gYWRkIG1vcmUgWG9yZy1vbmx5IGZlYXR1cmVzIGluIHRoZSBrZXJuZWw/CgpXZWxsLCBteSBw
cmVmZXJyZWQgc29sdXRpb24gd2FzIHRvIGFkZCB0aGUgbW9kZSBpbiB1c2Vyc3BhY2UgaW5zdGVh
ZCA6KQoKPiBJdCBmZWVscyBsaWtlICJpdCdzIGEgc2hvcnQgdGVybSBzb2x1dGlvbiBmb3IgWDEx
IiBjb3VsZCBiZSBhbG1vc3QgdXNlZAo+IGFzIGFuIGV4Y3VzZSB0byBhdm9pZCBwcm9wZXIgdUFQ
SSBkZXNpZ24gcHJvY2Vzcy4gSG93ZXZlciwgd2l0aCB1QVBJCj4gdGhlcmUgaXMgbm8gInNob3J0
IHRlcm0iLiBPbmNlIGl0J3MgaW4sIGl0J3MgdGhlcmUgZm9yIGRlY2FkZXMuIFNvIHdoeQo+IGRv
ZXMgaXQgbWF0dGVyIGlmIHlvdSBkZXNpZ24gaXQgZm9yIFhvcmcgZm9yZW1vc3Q/IEFyZSBvdGhl
cnMgZm9yYmlkZGVuCj4gdG8gbWFrZSB1c2Ugb2YgaXQ/IE9yIGRvIHlvdSBkZWxpYmVyYXRlbHkg
d2FudCB0byBkZXNpZ24gaXQgc28gdGhhdAo+IGl0J3Mgbm90IGdlbmVyYWxseSB1c2VmdWwgYW5k
IGl0IHdpbGwgaW5kZWVkIGVuZCB1cCBiZWluZyBhIHNob3J0IHRlcm0KPiBmZWF0dXJlPyBQbGFu
bmVkIG9ic29sZXNjZW5jZSBmcm9tIHRoZSBzdGFydD8KClllcyBleGFjdGx5LiBXZSBuZWVkIHNv
bWV0aGluZyB3aGljaCB3b3JrcyBmb3Igbm93IGFuZCBjYW4gYmUgcmVtb3ZlZCAKYWdhaW4gbGF0
ZXIgb24gd2hlbiB3ZSBoYXZlIGEgYmV0dGVyIHNvbHV0aW9uLiBBZGRpbmcgc29tZSBleHRyYSBt
b2RlcyAKaXMgbm90IGNvbnNpZGVyZWQgVUFQSSBzaW5jZSBib3RoIGRpc3BsYXlzIGFuZCBkcml2
ZXJzIGFyZSBkb2luZyB0aGlzIApmb3IgYSBjb3VwbGUgb2YgZGlmZmVyZW50IHB1cnBvc2VzIGFs
cmVhZHkuCgpBbm90aGVyIG1haW4gcmVhc29uIGlzIHRoYXQgdGhpcyBhcHByb2FjaCB3b3JrcyB3
aXRoIGV4aXN0aW5nIG1lZGlhIApwbGF5ZXJzIGxpa2UgbXB2IGFuZCBrb2RpIHdpdGhvdXQgY2hh
bmdpbmcgdGhlbSBiZWNhdXNlIHdlIGRvIHByZXR0eSAKbXVjaCB0aGUgc2FtZSB0aGluZyBpbiB0
aGUga2VybmVsIHdoaWNoIFRWcyBkbyBpbiB0aGVpciBFRElELgoKRS5nLiB3aGVuIHN0YXJ0aW5n
IHRvIHBsYXkgYSB2aWRlbyBrb2RpIHdpbGwgYXV0b21hdGljYWxseSB0cnkgdG8gc3dpdGNoIAp0
byBhIG1vZGUgd2hpY2ggaGFzIHRoZSBzYW1lIGZwcyBhcyB0aGUgdmlkZW8uCgo+Cj4+IEZvciB0
aGluZ3MgbGlrZSBXYXlsYW5kIHdlIHByb2JhYmx5IHdhbnQgdG8gYXBwcm9hY2ggdGhpcyBmcm9t
IGEKPj4gY29tcGxldGVseSBkaWZmZXJlbnQgdmVjdG9yLgo+Pgo+Pj4gV2hlbiB0aGUgV2F5bGFu
ZCBjb21wb3NpdG9yIHN0YXJ0cywgaXQgd2lsbCBjaG9vc2UgKnNvbWUqIHZpZGVvIG1vZGUKPj4+
IGZvciBhbiBvdXRwdXQuIEl0IG1heSBvciBtYXkgbm90IGJlIHdoYXQgYSBLTVMgZHJpdmVyIGNh
bGxzICJwcmVmZXJyZWQKPj4+IG1vZGUiLCBiZWNhdXNlIGl0IGRlcGVuZHMgb24gdGhpbmdzIGxp
a2UgdXNlciBwcmVmZXJlbmNlcy4gVGhlCj4+PiBjb21wb3NpdG9yIG1ha2VzIHRoZSBpbml0aWFs
IG1vZGVzZXQgdG8gdGhpcyBtb2RlLgo+PiBJIHRoaW5rIHRoZSBnZW5lcmFsIGlkZWEgd2Ugc2V0
dGxlZCBvbiBpcyB0aGF0IHdlIHNwZWNpZnkgYW4gZWFybGllc3QKPj4gZGlzcGxheSB0aW1lIGZv
ciBlYWNoIGZyYW1lIGFuZCBnaXZlIGZlZWRiYWNrIHRvIHRoZSBhcHBsaWNhdGlvbiB3aGVuIGEK
Pj4gZnJhbWUgd2FzIGFjdHVhbGx5IGRpc3BsYXllZC4KPiBUaGF0IGlzIGluZGVlZCBzb21ldGhp
bmcgY29tcGxldGVseSBkaWZmZXJlbnQsIGFuZCBmZWVscyBsaWtlIGl0IHdvdWxkCj4gYmUgc2V2
ZXJhbCB5ZWFycyBpbiB0aGUgZnV0dXJlLCB3aGlsZSB0aGUgcHJvcG9zZWQgc2NoZW1lIG9yIHRo
ZQo+IG1pbi9tYXggcHJvcGVydGllcyBjb3VsZCBiZSBkb25lIGZhaXJseSBxdWlja2x5LiBCdXQg
SSdtIG5vdCBpbiBhIGh1cnJ5LgoKWDExIGFscmVhZHkgc3VwcG9ydHMgdGhhdCB3aXRoIHRoZSBE
UkkzIGV4dGVuc2lvbi4gQWxzbyBzZWUgVkRQQVUgCnByZXNlbnQgYW5kIHRoZSBWdWxrYW4gZXh0
ZW5zaW9uIGZvciByZWZlcmVuY2UgYXBwbGljYXRpb24gQVBJIAppbXBsZW1lbnRhdGlvbnMsIHNv
IHRoYXQgc3R1ZmYgaXMgYWxyZWFkeSBwcmVzZW50LgoKSXQncyBqdXN0IG5vdCB3aXJlZCB1cCBj
b3JyZWN0bHkgd2l0aCBLTVMgYW5kIHdlIGRvbid0IGhhdmUgYW55dGhpbmcgCnNpbWlsYXIgaW4g
V2F5bGFuZCBhcyBmYXIgYXMgSSBrbm93LgoKPiBTZXR0aW5nIHRoZSBlYXJsaWVzdCBkaXNwbGF5
IHRpbWUgZm9yIGEgZmxpcCBkb2VzIG5vdCBmdWxseSBjb3ZlciB3aGF0Cj4gdmlkZW8gbW9kZSB0
aW1pbmcgYWRqdXN0bWVudCBvciBtaW4vbWF4IGZyYW1lIHRpbWUgb3IgcmVmcmVzaCByYXRlCj4g
cHJvcGVydHkgd291bGQgb2ZmZXI6IHByZWRpY3Rpb24gb2Ygd2hlbiB0aGUgbmV4dCBmbGlwIGNh
biBoYXBwZW4uCj4gQ2hvb3NpbmcgZGlzcGxheSB0aW1lcyByZXF1aXJlcyBrbm93aW5nIHRoZSBw
b3NzaWJsZSBkaXNwbGF5IHRpbWVzLCBzbwo+IHNvbWV0aGluZyBtb3JlIGlzIG5lZWRlZC4gVGhl
IG1pbi9tYXggcHJvcGVydGllcyB3b3VsZCBmaXQgaW4uCgpXZWxsIHlvdSBuZWVkIHRvIGNvbW11
bmljYXRlIHRvIHRoZSBhcHBsaWNhdGlvbiB3aGF0IHRoZSBtaW5pbXVtIGFuZCAKbWF4aW11bSBy
ZWZyZXNoIHJhdGVzIGFyZSBieSBzb21lIGV4dGVuc2lvbiBvZiB0aGUgbW9kZSBkZXNjcmlwdGlv
bi4KClJlZ2FyZHMsCkNocmlzdGlhbi4KCgo+Cj4+IFRoaXMgYXBwcm9hY2ggc2hvdWxkIGFsc28g
YmUgYWJsZSB0byBoYW5kbGUgbXVsdGlwbGUgYXBwbGljYXRpb25zIHdpdGgKPj4gZGlmZmVyZW50
IHJlZnJlc2ggcmF0ZXMuIEUuZy4ganVzdCB0aGluayBvZiBhIHZpZGVvIHBsYXliYWNrIHdpdGgg
MjUgYW5kCj4+IGFub3RoZXIgb25lIHdpdGggMzAgSHogaW4gdHdvIHdpbmRvd3Mgd2hlbiB0aGUg
bWF4IHJlZnJlc2ggcmF0ZSBpcwo+PiBzb21ldGhpbmcgbGlrZSAxMjBIei4KPiBCdXQgdGhhdCdz
IGp1c3QgYW4gZXh0ZW5zaW9uIHRvIHdoYXQgSSBhbHJlYWR5IGRlc2NyaWJlZCBhbmQgY29tcGxl
dGVseQo+IHBvc3NpYmxlIHdpdGggdGhlIHByb3Bvc2VkIGFuZCB0aGUgbWluL21heCBhcHByb2Fj
aGVzLgo+Cj4KPiBUaGFua3MsCj4gcHEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
YW1kLWdmeAo=
