Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A1A1446060
	for <lists+amd-gfx@lfdr.de>; Fri,  5 Nov 2021 08:58:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 523986E42E;
	Fri,  5 Nov 2021 07:58:15 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2053.outbound.protection.outlook.com [40.107.236.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEE806E42E
 for <amd-gfx@lists.freedesktop.org>; Fri,  5 Nov 2021 07:58:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kuikwdsuVjIVBJ/xAKU9iJXsB8/OTroV9MJsRiLMXbgSPlMgj7pm5Oo2PG/0Bu8OBAvQUuhCQoxmViukW9p80ajEnMXtZiSUfc+vX0mThjpmllb6brHJBwXidR2n09JJGxHRtuMO8qmGn27bB5GpTsfhrYzy3yZ/EHlJNybac3Go51tCdQGhQAZ9W8NyCAYwdFdbvjb0cUNmj05SW1Zv6NatTY3rWL894ppM6hIWNpYuWCz4AdZ/Q5J5PuKVoMqs7K5MQ3gV/Zm/rcvpnFMOmb0ilrpldQelMvJkpYP6AR3S3V4eaF2xoJyqtNOMoYGs6jO0t3qyOh2kAxIQfByNpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VXodHiQtvqdfu+CEoTGBFfrlfGcc1/SR0wYb4J3j1e0=;
 b=VZKSg4O2haPxa3dfD1RbZFQxRlIBgfzp4YO0PXgVK9viGArxB2pyjEAGAIJH11f0AcXDJmpOaMjfFPyrwvisI8s4rAoUfKi4WCdWB15D1JQ4XJiAJ2zKikhSxUiwhDybyWO2qqX0RYNmAf8AR1sNW/q7UnGHpqeUWqLGPxj/pPqXYKtZTmWVGMTb5hrXWSYClaeU4anhsaku2nVZr3j4+QKdIggIKO2rGZW80Zvp32ASD7SlAv2zAz18WyzxKqA7wRnOkwPXa1Tu6uF7D1BFIs0nPzkDoa90U3B6MduRhBRdhRb5zdyI8i0aTQFsW7DbGA53Ncl4gIJaCDEg42UOzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VXodHiQtvqdfu+CEoTGBFfrlfGcc1/SR0wYb4J3j1e0=;
 b=e/Qwjxw2AuNxpo0kBdH6c3FALNkS4cvuwMjhXSM+pWA+oXdSEBz9ukgT7UhAglwpfmkkzC5cISvvzo5j3884vanyD1a55ZpmPZm7W7VANyyZvDkWHgFRhfSXAgfDafOfYoKcskwLnqj2a6MG02C6yscyAl36ABwy/XapGgDsyqQ=
Received: from DM6PR12MB2619.namprd12.prod.outlook.com (2603:10b6:5:45::18) by
 DM5PR12MB4680.namprd12.prod.outlook.com (2603:10b6:4:a6::33) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4669.11; Fri, 5 Nov 2021 07:58:11 +0000
Received: from DM6PR12MB2619.namprd12.prod.outlook.com
 ([fe80::35c8:7b2f:1090:d3a5]) by DM6PR12MB2619.namprd12.prod.outlook.com
 ([fe80::35c8:7b2f:1090:d3a5%6]) with mapi id 15.20.4649.020; Fri, 5 Nov 2021
 07:58:11 +0000
From: "Quan, Evan" <Evan.Quan@amd.com>
To: "Lazar, Lijo" <Lijo.Lazar@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amdgpu: fix the Carrizo UVD hang on system reboot
Thread-Topic: [PATCH] drm/amdgpu: fix the Carrizo UVD hang on system reboot
Thread-Index: AQHX0VS7PwFkko4yAUimRHusmnsiTKvzEJ4AgAGAxuA=
Date: Fri, 5 Nov 2021 07:58:11 +0000
Message-ID: <DM6PR12MB261981F9883D33EA4A9BD549E48E9@DM6PR12MB2619.namprd12.prod.outlook.com>
References: <20211104081931.467399-1-evan.quan@amd.com>
 <675b8367-3b91-a565-f656-fe46ba65723c@amd.com>
In-Reply-To: <675b8367-3b91-a565-f656-fe46ba65723c@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Enabled=true;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SetDate=2021-11-05T07:58:09Z; 
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Method=Standard;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Name=AMD Official Use
 Only-AIP 2.0;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ActionId=94f08cd7-0918-4ef1-aa93-7d0e955eb6d3;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ContentBits=1
authentication-results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e55de173-eabc-4071-556a-08d9a0320367
x-ms-traffictypediagnostic: DM5PR12MB4680:
x-microsoft-antispam-prvs: <DM5PR12MB4680745E4F46CC598E767AC0E48E9@DM5PR12MB4680.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bwhWi/xs7HCspEcWOvmK+v2UgRRBgTiyyePUtr7DkXGU8UULMt4IhDME7z0n2NRybb1LTnrga6gz6ev9gPoSKAgxLSwOx20spuMBLTJ7mcCOW+sMKkViniUgJHty0ESfXeWg1CRw1ZfclKzXJdRNWjyJmL13ddlLQEoXkJw0CRWtk4r6H0oOoWHrKbe8oq1c7TfTU2m3wDDj33HNOHyC15uAPtqVeDkitVThBd8QbcWcS2S0OtabqWNxpHMh2+EEVmBRG1/aNRU3iNkBwPasrWFqYLD7163uTyt1r0SJlqFD6eVr7MzDho3QOGcSRhSOtRuqoyNRfRSYtVjE9hYTenII/b1edOPyUdhINFnj7mX91qs3AripA+9nraXV/Pgit8RzmFOOLgp5gAnvH9maq9Z4XwHSMoMMW9tN67J1Elka/rUS6r0wXun6Gk6xUlWj/3+Gs1NX22SUaWzwzbEYZXgIxq5p8PTGeRmjoQ6AlSwy21GlQvfR08f7tdvuuEwu+fURti15SVCdKQqoXQQC/oP9dzeCRji+m3dNmI5H4h0MIXG3whd54y73C5kBKA/2VtpwqAkmeRnwHKeeqbcvADOZEhfCFaCsa2MSXWP2OzNdN61lz5WfEPuSK1JknALNDF2jWmjLgjFmfnV2AyLYao/F0A+Z5YdKpDRCHg2lR7NQamxZn5IyqgaI9dzA3KQkKeB9C/YGleitQTX6fxFYZQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB2619.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(122000001)(8676002)(4326008)(9686003)(38070700005)(86362001)(2906002)(52536014)(5660300002)(71200400001)(66946007)(76116006)(66476007)(64756008)(66556008)(66446008)(8936002)(7696005)(53546011)(186003)(6506007)(26005)(38100700002)(508600001)(33656002)(83380400001)(55016002)(110136005)(316002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Zk13TUtHTEkvclQybGp0WTJaais4R3BncHV6T2VwY1lXdnQwdEZLWmJHWXpo?=
 =?utf-8?B?K2Jnd3Qwb2NKRENYWnhRSTZWTXBmeGJPcm5na2ZCU3FwUEppTTlXUFB4R294?=
 =?utf-8?B?RXdPRkhHczV4aDl1cFU4OGJMZTRmN2JoZTZ5TUo2Y1FZTHU3Z0xoc1RpSEdG?=
 =?utf-8?B?NUVHNGg0WEd1THZvUmJudWM3WUJFNmZHcE9teEJVMGdCMlJDRU4zTzdPeFpq?=
 =?utf-8?B?K05TT3ZtQkF6WENIUThxaXVBWjU2R0RIL2owK3FxWjVYMTFMa0hvMWc2TmM4?=
 =?utf-8?B?R1ZBMTdpZXFjenptMmRScGhLM1pPd1VTeEdDTHFURkZESjUvTzI1YTJDemhX?=
 =?utf-8?B?bGtFZkgyQXNuNUw2MlRKY0Q0b0Q3RVU1WFNvQThOVFZJRmY4dVhGSmdqN1Rl?=
 =?utf-8?B?T0h0eG5zb0xYTis3VENHbXNmVTQrZTlZbXRNUkEveHg0aHUyUGxYVHF4V1Yw?=
 =?utf-8?B?Q0pzVkJCdFVwQ3pSRHJmUnFveGR0VkVlRTJhSVlxdWdqdHIrU0hLbUgyQUl2?=
 =?utf-8?B?d1VwTTROVy9PTFBheWYvNWNEZ3pRczNnMFc2RG1vcmwxbXo5TUF1R3ZPWXFt?=
 =?utf-8?B?QTFXRUwwalQzdnRiZXRxMVVxUk9JK3o2SFJHRHlWRmxPZHBVb2FvZkpUZy9R?=
 =?utf-8?B?aFhIOXp5ZkMvNVNObzZmUThHYVg3RlArREErZnpvVVoxWnpYY0Y0S09DV2p0?=
 =?utf-8?B?dmx5bmU1Zk5qRW1JZTZnU0lPNkZQMTV6NGpleTJNczN0dGlGQjZzY2lRUVBu?=
 =?utf-8?B?NVNFc3FualE2Vzh1WTdkWE1xTUI0b1hVNGNPelRyTkt0cE9Sc0hjNWN5M2lj?=
 =?utf-8?B?VjJKTmY0SS9tVHRoRUtCTmlaWEcxWjRpL2pMTGIrK3F2ZlBKL1d2bUlUa0Er?=
 =?utf-8?B?WkhmcTBHUTdZdU1uUFVic1ZjNGpmT3R4VWtoRHc3QjlTQWRuUnI2NVBHVUtU?=
 =?utf-8?B?Z1lvL0g1ZlV1a1o1TzJRell3aGNVa1dxU2I3dWtGVUJNbjBTbm1pdWN5Qy9E?=
 =?utf-8?B?NU4zdHZLWnpnQ3M2TGhuQ2VEUjNDUkh6ajR5Q2wzcFhTVy9ZTTU5dUJQcXc1?=
 =?utf-8?B?Zm8yaEdVZ3NqbkRSdFErWXFzTVk1c21TNmRQcUh6OGNpazNXcE9qeFhETStH?=
 =?utf-8?B?V0ptSFEvZnU2emZzMFgxb2hXSU9KUGJCQ2U5VFdQWG96ajRXWjJteGlpa1h2?=
 =?utf-8?B?aHNYenNtL0tzWUNBMnh3Z0V0M1hTZnM3US8yczZoQ0dvMGNLY254d1lFN25M?=
 =?utf-8?B?UVVaK0h3VEx6ZW9USmFZQTRyVHBlaVd6SFlBRVovNFEyVC93ckRzenhwWG1R?=
 =?utf-8?B?V0VkdXpOOWgyQ2pOSWxCWFFaT0pqWTRnbVZPTE5yNkRVMUl3UDlTL016SFd5?=
 =?utf-8?B?ZXZyY2Qveksrb3BsMDBkSkhIdnc4ekVuOFdDbldwTXVqSWxQcUUwNzRJV0xO?=
 =?utf-8?B?Zk56R0t5bHlYajJpSWo4Yk83RmR3YnNaZXJ1SXNjQTFpMHhveXNrWEw4ZzdV?=
 =?utf-8?B?bDNkVGVKMEpNQk84SmZITkpiRFI5MThZZFFHWm5QL1F6R0NVMFM3eXdrSHk0?=
 =?utf-8?B?M0lFem1LK3M5R2VtMHNxMksxRHlXb3VUTktwKzFHVU5vMzlSMTJZSURBZ09o?=
 =?utf-8?B?WUpkenpDLzV6NkZZMG0rMnVDZkNPQWN3ZVRHUXZmUlFIT1pmNmVnRE94KzBR?=
 =?utf-8?B?R2xybzh6MGVWdTBab2MvL3liY2JPWnRTTkM0bDB0TVhMS3VvTGNCZjFUVmYz?=
 =?utf-8?B?YmVQd2lWRFVUNkdnM2JoM3huS2RkSHg4WjNjbGtPNG1UYWcxNncwaUNLMVp1?=
 =?utf-8?B?OW94d2dWQ054TUxJZ3FPUzFrRzEvRHhRNWFNUUdnTUFFR3pTOTFkZkUrOCtz?=
 =?utf-8?B?U1FOM0Nlc1ZqUU9BaGRxakV5a2ZZeEMyVTZqaFVqbkM2eE1WMXN4V0dHaGVa?=
 =?utf-8?B?VG1xaGJobjdZWnB3U3pjcDR2ZkRYcWZ6ZFFUelpHZVBrT3U3WXBldHBZUGRj?=
 =?utf-8?B?L0VZNnNZcEF3VnkzNEJjeTFvajBYcVdwRFlyTmltVmN3T1lmWnpkRkUzUmlO?=
 =?utf-8?B?TEowNmdTUlAzMUMyc2lCd3Fxd1pKQmI4d0N6bHpYVTNnSWI1QmR2VzhkTGp1?=
 =?utf-8?Q?ZBQU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB2619.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e55de173-eabc-4071-556a-08d9a0320367
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Nov 2021 07:58:11.4169 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iDQIf+Pl/1QMg5vfIDksjaa8PyuoMKyjrSkqggadm57xotEdsVQ0p7TowUausHpa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB4680
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

W0FNRCBPZmZpY2lhbCBVc2UgT25seV0NCg0KDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0t
LS0NCj4gRnJvbTogTGF6YXIsIExpam8gPExpam8uTGF6YXJAYW1kLmNvbT4NCj4gU2VudDogVGh1
cnNkYXksIE5vdmVtYmVyIDQsIDIwMjEgNDo1NSBQTQ0KPiBUbzogUXVhbiwgRXZhbiA8RXZhbi5R
dWFuQGFtZC5jb20+OyBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBDYzogRGV1Y2hl
ciwgQWxleGFuZGVyIDxBbGV4YW5kZXIuRGV1Y2hlckBhbWQuY29tPg0KPiBTdWJqZWN0OiBSZTog
W1BBVENIXSBkcm0vYW1kZ3B1OiBmaXggdGhlIENhcnJpem8gVVZEIGhhbmcgb24gc3lzdGVtDQo+
IHJlYm9vdA0KPiANCj4gDQo+IA0KPiBPbiAxMS80LzIwMjEgMTo0OSBQTSwgRXZhbiBRdWFuIHdy
b3RlOg0KPiA+IEl0J3MgY29uZmlybWVkIHRoYXQgb24gc29tZSBBUFVzIHRoZSBpbnRlcmFjdGlv
biB3aXRoIFNNVSBhYm91dCBEUE0NCj4gPiBkaXNhYmxlbWVudCB3aWxsIHBvd2VyIG9mZiB0aGUg
VVZEIGNvbXBsZXRlbHkuIFRodXMgdGhlIHN1Y2NlZWRpbmcNCj4gPiBpbnRlcmFjdGlvbnMgd2l0
aCBVVkQgZHVyaW5nIHRoZSByZWJvb3Qgd2lsbCB0cmlnZ2VyIGhhcmQgaGFuZy4gVG8NCj4gPiB3
b3JrYXJvdW5kIHRoaXMgaXNzdWUsIHdlIHdpbGwgc2tpcCB0aGUgZHBtIGRpc2FibGVtZW50IG9u
IEFQVXMuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBFdmFuIFF1YW4gPGV2YW4ucXVhbkBhbWQu
Y29tPg0KPiA+IENoYW5nZS1JZDogSTQzNDBjYzJmYjBmZDk0ZjQzOWNiYWM1ZDQ5NjNmZTkyMDg2
NmJjMTMNCj4gPiAtLS0NCj4gPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3V2ZF92NF8y
LmMgfCAyMCArKysrKysrKysrLS0tLS0tLS0NCj4gPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L3V2ZF92Nl8wLmMgfCAzMA0KPiArKysrKysrKysrKysrKysrKysrLS0tLS0tLS0NCj4gPiAg
IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3ZjZV92Ml8wLmMgfCAxOCArKysrKysrKystLS0t
LS0tDQo+ID4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS92Y2VfdjNfMC5jIHwgMTggKysr
KysrKysrLS0tLS0tLQ0KPiA+ICAgNCBmaWxlcyBjaGFuZ2VkLCA1MiBpbnNlcnRpb25zKCspLCAz
NCBkZWxldGlvbnMoLSkNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS91dmRfdjRfMi5jDQo+ID4gYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS91dmRf
djRfMi5jDQo+ID4gaW5kZXggYzEwOGI4MzgxNzk1Li42N2VjMTM2MjJlNTEgMTAwNjQ0DQo+ID4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdXZkX3Y0XzIuYw0KPiA+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3V2ZF92NF8yLmMNCj4gPiBAQCAtMjM4LDE1ICsyMzgs
MTcgQEAgc3RhdGljIGludCB1dmRfdjRfMl9zdXNwZW5kKHZvaWQgKmhhbmRsZSkNCj4gPiAgIAkg
Ki8NCj4gPiAgIAljYW5jZWxfZGVsYXllZF93b3JrX3N5bmMoJmFkZXYtPnV2ZC5pZGxlX3dvcmsp
Ow0KPiANCj4gSWYgdGhlIGlkbGUgd29yayBoYW5kbGVyIGhhZCBhbHJlYWR5IHN0YXJ0ZWQgZXhl
Y3V0aW9uLCBpdCBhbHNvIGdvZXMgdGhyb3VnaA0KPiB0aGUgc2FtZSBsb2dpYy4gV291bGRuJ3Qg
dGhhdCBiZSBhIHByb2JsZW0/IFRoZSBvdGhlciBjYXNlIGlzIGlmIGRlY29kZSB3b3JrDQo+IGlz
IGFscmVhZHkgY29tcGxldGVkIGJlZm9yZSBzdXNwZW5kIGlzIGNhbGxlZCwgdGhlbiBhbHNvIGl0
IGRpc2FibGVzIERQTS4gTm90DQo+IHN1cmUgaG93IGl0IHdvcmtzIHRoZW4sIG9yIGlzIHRoaXMg
Y2F1c2VkIGJ5IGEgc2Vjb25kIGF0ZW1wdCB0byBwb3dlciBvZmYNCj4gYWdhaW4gYWZ0ZXIgaWRs
ZSB3b3JrIGlzIGV4ZWN1dGVkPw0KW1F1YW4sIEV2YW5dIEdvb2QgcG9pbnQuIFllcywgbWF5YmUg
dGhlcmUgc2hvdWxkIG5vdCBiZSAybmQgYXR0ZW1wdCB3aGVuIHRoZSB0YXJnZXQgSVAgaXMgYWxy
ZWFkeSBpbiB0aGUgZGVzaXJlZCBzdGF0ZS4NCkxldCBtZSBjb25maXJtIHdpdGggQm9yaXMuDQoN
CkJSDQpFdmFuDQo+IA0KPiBUaGFua3MsDQo+IExpam8NCj4gDQo+ID4NCj4gPiAtCWlmIChhZGV2
LT5wbS5kcG1fZW5hYmxlZCkgew0KPiA+IC0JCWFtZGdwdV9kcG1fZW5hYmxlX3V2ZChhZGV2LCBm
YWxzZSk7DQo+ID4gLQl9IGVsc2Ugew0KPiA+IC0JCWFtZGdwdV9hc2ljX3NldF91dmRfY2xvY2tz
KGFkZXYsIDAsIDApOw0KPiA+IC0JCS8qIHNodXRkb3duIHRoZSBVVkQgYmxvY2sgKi8NCj4gPiAt
CQlhbWRncHVfZGV2aWNlX2lwX3NldF9wb3dlcmdhdGluZ19zdGF0ZShhZGV2LA0KPiBBTURfSVBf
QkxPQ0tfVFlQRV9VVkQsDQo+ID4gLQkJCQkJCSAgICAgICBBTURfUEdfU1RBVEVfR0FURSk7DQo+
ID4gLQkJYW1kZ3B1X2RldmljZV9pcF9zZXRfY2xvY2tnYXRpbmdfc3RhdGUoYWRldiwNCj4gQU1E
X0lQX0JMT0NLX1RZUEVfVVZELA0KPiA+IC0JCQkJCQkgICAgICAgQU1EX0NHX1NUQVRFX0dBVEUp
Ow0KPiA+ICsJaWYgKCEoYWRldi0+ZmxhZ3MgJiBBTURfSVNfQVBVKSkgew0KPiA+ICsJCWlmIChh
ZGV2LT5wbS5kcG1fZW5hYmxlZCkgew0KPiA+ICsJCQlhbWRncHVfZHBtX2VuYWJsZV91dmQoYWRl
diwgZmFsc2UpOw0KPiA+ICsJCX0gZWxzZSB7DQo+ID4gKwkJCWFtZGdwdV9hc2ljX3NldF91dmRf
Y2xvY2tzKGFkZXYsIDAsIDApOw0KPiA+ICsJCQkvKiBzaHV0ZG93biB0aGUgVVZEIGJsb2NrICov
DQo+ID4gKwkJCWFtZGdwdV9kZXZpY2VfaXBfc2V0X3Bvd2VyZ2F0aW5nX3N0YXRlKGFkZXYsDQo+
IEFNRF9JUF9CTE9DS19UWVBFX1VWRCwNCj4gPiArDQo+IEFNRF9QR19TVEFURV9HQVRFKTsNCj4g
PiArCQkJYW1kZ3B1X2RldmljZV9pcF9zZXRfY2xvY2tnYXRpbmdfc3RhdGUoYWRldiwNCj4gQU1E
X0lQX0JMT0NLX1RZUEVfVVZELA0KPiA+ICsNCj4gQU1EX0NHX1NUQVRFX0dBVEUpOw0KPiA+ICsJ
CX0NCj4gPiAgIAl9DQo+ID4NCj4gPiAgIAlyID0gdXZkX3Y0XzJfaHdfZmluaShhZGV2KTsNCj4g
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdXZkX3Y2XzAuYw0KPiA+
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdXZkX3Y2XzAuYw0KPiA+IGluZGV4IDJkNTU4
YzJmNDE3ZC4uNjBkMDVlYzhjOTUzIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L3V2ZF92Nl8wLmMNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS91dmRfdjZfMC5jDQo+ID4gQEAgLTU2MCwxNSArNTYwLDI3IEBAIHN0YXRpYyBpbnQgdXZkX3Y2
XzBfc3VzcGVuZCh2b2lkICpoYW5kbGUpDQo+ID4gICAJICovDQo+ID4gICAJY2FuY2VsX2RlbGF5
ZWRfd29ya19zeW5jKCZhZGV2LT51dmQuaWRsZV93b3JrKTsNCj4gPg0KPiA+IC0JaWYgKGFkZXYt
PnBtLmRwbV9lbmFibGVkKSB7DQo+ID4gLQkJYW1kZ3B1X2RwbV9lbmFibGVfdXZkKGFkZXYsIGZh
bHNlKTsNCj4gPiAtCX0gZWxzZSB7DQo+ID4gLQkJYW1kZ3B1X2FzaWNfc2V0X3V2ZF9jbG9ja3Mo
YWRldiwgMCwgMCk7DQo+ID4gLQkJLyogc2h1dGRvd24gdGhlIFVWRCBibG9jayAqLw0KPiA+IC0J
CWFtZGdwdV9kZXZpY2VfaXBfc2V0X3Bvd2VyZ2F0aW5nX3N0YXRlKGFkZXYsDQo+IEFNRF9JUF9C
TE9DS19UWVBFX1VWRCwNCj4gPiAtCQkJCQkJICAgICAgIEFNRF9QR19TVEFURV9HQVRFKTsNCj4g
PiAtCQlhbWRncHVfZGV2aWNlX2lwX3NldF9jbG9ja2dhdGluZ19zdGF0ZShhZGV2LA0KPiBBTURf
SVBfQkxPQ0tfVFlQRV9VVkQsDQo+ID4gLQkJCQkJCSAgICAgICBBTURfQ0dfU1RBVEVfR0FURSk7
DQo+ID4gKwkvKg0KPiA+ICsJICogSXQncyBjb25maXJtZWQgdGhhdCBvbiBzb21lIEFQVXMgdGhl
IGludGVyYWN0aW9uIHdpdGggU01VKGFib3V0DQo+IERQTSBkaXNhYmxlbWVudCkNCj4gPiArCSAq
IHdpbGwgcG93ZXIgb2ZmIHRoZSBVVkQuIFRoYXQgd2lsbCBtYWtlIHRoZSBzdWNjZWVkaW5nIGlu
dGVyYWN0aW9ucw0KPiB3aXRoIFVWRCBvbiB0aGUNCj4gPiArCSAqIHN1c3BlbmQgcGF0aCBpbXBv
c3NpYmxlLiBBbmQgdGhlIHN5c3RlbSB3aWxsIGhhbmcgZHVlIHRvIHRoYXQuIFRvDQo+IHdvcmth
cm91bmQgdGhlDQo+ID4gKwkgKiBpc3N1ZSwgd2Ugd2lsbCBza2lwIHRoZSBkcG0gZGlzYWJsZW1l
bnQgb24gQVBVcy4NCj4gPiArCSAqDQo+ID4gKwkgKiBUT0RPOiBhIGJldHRlciBzb2x1dGlvbiBp
cyB0byByZW9yZyB0aGUgYWN0aW9uIGNoYWlucyBwZXJmb3JtZWQgb24NCj4gc3VzcGVuZCBhbmQg
bWFrZQ0KPiA+ICsJICogdGhlIGRwbSBkaXNhYmxlbWVudCB0aGUgbGFzdCBvbmUuIEJ1dCB0aGF0
IHdpbGwgaW52b2x2ZSBhIGxvdCBhbmQNCj4gbmVlZHMgTU0gdGVhbSdzDQo+ID4gKwkgKiBoZWxw
Lg0KPiA+ICsJICovDQo+ID4gKwlpZiAoIShhZGV2LT5mbGFncyAmIEFNRF9JU19BUFUpKSB7DQo+
ID4gKwkJaWYgKGFkZXYtPnBtLmRwbV9lbmFibGVkKSB7DQo+ID4gKwkJCWFtZGdwdV9kcG1fZW5h
YmxlX3V2ZChhZGV2LCBmYWxzZSk7DQo+ID4gKwkJfSBlbHNlIHsNCj4gPiArCQkJYW1kZ3B1X2Fz
aWNfc2V0X3V2ZF9jbG9ja3MoYWRldiwgMCwgMCk7DQo+ID4gKwkJCS8qIHNodXRkb3duIHRoZSBV
VkQgYmxvY2sgKi8NCj4gPiArCQkJYW1kZ3B1X2RldmljZV9pcF9zZXRfcG93ZXJnYXRpbmdfc3Rh
dGUoYWRldiwNCj4gQU1EX0lQX0JMT0NLX1RZUEVfVVZELA0KPiA+ICsNCj4gQU1EX1BHX1NUQVRF
X0dBVEUpOw0KPiA+ICsJCQlhbWRncHVfZGV2aWNlX2lwX3NldF9jbG9ja2dhdGluZ19zdGF0ZShh
ZGV2LA0KPiBBTURfSVBfQkxPQ0tfVFlQRV9VVkQsDQo+ID4gKw0KPiBBTURfQ0dfU1RBVEVfR0FU
RSk7DQo+ID4gKwkJfQ0KPiA+ICAgCX0NCj4gPg0KPiA+ICAgCXIgPSB1dmRfdjZfMF9od19maW5p
KGFkZXYpOw0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS92Y2Vf
djJfMC5jDQo+ID4gYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS92Y2VfdjJfMC5jDQo+ID4g
aW5kZXggNjdlYjAxZmVmNzg5Li44YWE5ZDhjMDcwNTMgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvdmNlX3YyXzAuYw0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L3ZjZV92Ml8wLmMNCj4gPiBAQCAtNTA1LDE0ICs1MDUsMTYgQEAgc3RhdGlj
IGludCB2Y2VfdjJfMF9zdXNwZW5kKHZvaWQgKmhhbmRsZSkNCj4gPiAgIAkgKi8NCj4gPiAgIAlj
YW5jZWxfZGVsYXllZF93b3JrX3N5bmMoJmFkZXYtPnZjZS5pZGxlX3dvcmspOw0KPiA+DQo+ID4g
LQlpZiAoYWRldi0+cG0uZHBtX2VuYWJsZWQpIHsNCj4gPiAtCQlhbWRncHVfZHBtX2VuYWJsZV92
Y2UoYWRldiwgZmFsc2UpOw0KPiA+IC0JfSBlbHNlIHsNCj4gPiAtCQlhbWRncHVfYXNpY19zZXRf
dmNlX2Nsb2NrcyhhZGV2LCAwLCAwKTsNCj4gPiAtCQlhbWRncHVfZGV2aWNlX2lwX3NldF9wb3dl
cmdhdGluZ19zdGF0ZShhZGV2LA0KPiBBTURfSVBfQkxPQ0tfVFlQRV9WQ0UsDQo+ID4gLQkJCQkJ
CSAgICAgICBBTURfUEdfU1RBVEVfR0FURSk7DQo+ID4gLQkJYW1kZ3B1X2RldmljZV9pcF9zZXRf
Y2xvY2tnYXRpbmdfc3RhdGUoYWRldiwNCj4gQU1EX0lQX0JMT0NLX1RZUEVfVkNFLA0KPiA+IC0J
CQkJCQkgICAgICAgQU1EX0NHX1NUQVRFX0dBVEUpOw0KPiA+ICsJaWYgKCEoYWRldi0+ZmxhZ3Mg
JiBBTURfSVNfQVBVKSkgew0KPiA+ICsJCWlmIChhZGV2LT5wbS5kcG1fZW5hYmxlZCkgew0KPiA+
ICsJCQlhbWRncHVfZHBtX2VuYWJsZV92Y2UoYWRldiwgZmFsc2UpOw0KPiA+ICsJCX0gZWxzZSB7
DQo+ID4gKwkJCWFtZGdwdV9hc2ljX3NldF92Y2VfY2xvY2tzKGFkZXYsIDAsIDApOw0KPiA+ICsJ
CQlhbWRncHVfZGV2aWNlX2lwX3NldF9wb3dlcmdhdGluZ19zdGF0ZShhZGV2LA0KPiBBTURfSVBf
QkxPQ0tfVFlQRV9WQ0UsDQo+ID4gKw0KPiBBTURfUEdfU1RBVEVfR0FURSk7DQo+ID4gKwkJCWFt
ZGdwdV9kZXZpY2VfaXBfc2V0X2Nsb2NrZ2F0aW5nX3N0YXRlKGFkZXYsDQo+IEFNRF9JUF9CTE9D
S19UWVBFX1ZDRSwNCj4gPiArDQo+IEFNRF9DR19TVEFURV9HQVRFKTsNCj4gPiArCQl9DQo+ID4g
ICAJfQ0KPiA+DQo+ID4gICAJciA9IHZjZV92Ml8wX2h3X2ZpbmkoYWRldik7DQo+ID4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3ZjZV92M18wLmMNCj4gPiBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3ZjZV92M18wLmMNCj4gPiBpbmRleCAxNDJlMjkxOTgzYjQu
LmIxNzdjZDQ0MjgzOCAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS92Y2VfdjNfMC5jDQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdmNlX3Yz
XzAuYw0KPiA+IEBAIC01MjAsMTQgKzUyMCwxNiBAQCBzdGF0aWMgaW50IHZjZV92M18wX3N1c3Bl
bmQodm9pZCAqaGFuZGxlKQ0KPiA+ICAgCSAqLw0KPiA+ICAgCWNhbmNlbF9kZWxheWVkX3dvcmtf
c3luYygmYWRldi0+dmNlLmlkbGVfd29yayk7DQo+ID4NCj4gPiAtCWlmIChhZGV2LT5wbS5kcG1f
ZW5hYmxlZCkgew0KPiA+IC0JCWFtZGdwdV9kcG1fZW5hYmxlX3ZjZShhZGV2LCBmYWxzZSk7DQo+
ID4gLQl9IGVsc2Ugew0KPiA+IC0JCWFtZGdwdV9hc2ljX3NldF92Y2VfY2xvY2tzKGFkZXYsIDAs
IDApOw0KPiA+IC0JCWFtZGdwdV9kZXZpY2VfaXBfc2V0X3Bvd2VyZ2F0aW5nX3N0YXRlKGFkZXYs
DQo+IEFNRF9JUF9CTE9DS19UWVBFX1ZDRSwNCj4gPiAtCQkJCQkJICAgICAgIEFNRF9QR19TVEFU
RV9HQVRFKTsNCj4gPiAtCQlhbWRncHVfZGV2aWNlX2lwX3NldF9jbG9ja2dhdGluZ19zdGF0ZShh
ZGV2LA0KPiBBTURfSVBfQkxPQ0tfVFlQRV9WQ0UsDQo+ID4gLQkJCQkJCSAgICAgICBBTURfQ0df
U1RBVEVfR0FURSk7DQo+ID4gKwlpZiAoIShhZGV2LT5mbGFncyAmIEFNRF9JU19BUFUpKSB7DQo+
ID4gKwkJaWYgKGFkZXYtPnBtLmRwbV9lbmFibGVkKSB7DQo+ID4gKwkJCWFtZGdwdV9kcG1fZW5h
YmxlX3ZjZShhZGV2LCBmYWxzZSk7DQo+ID4gKwkJfSBlbHNlIHsNCj4gPiArCQkJYW1kZ3B1X2Fz
aWNfc2V0X3ZjZV9jbG9ja3MoYWRldiwgMCwgMCk7DQo+ID4gKwkJCWFtZGdwdV9kZXZpY2VfaXBf
c2V0X3Bvd2VyZ2F0aW5nX3N0YXRlKGFkZXYsDQo+IEFNRF9JUF9CTE9DS19UWVBFX1ZDRSwNCj4g
PiArDQo+IEFNRF9QR19TVEFURV9HQVRFKTsNCj4gPiArCQkJYW1kZ3B1X2RldmljZV9pcF9zZXRf
Y2xvY2tnYXRpbmdfc3RhdGUoYWRldiwNCj4gQU1EX0lQX0JMT0NLX1RZUEVfVkNFLA0KPiA+ICsN
Cj4gQU1EX0NHX1NUQVRFX0dBVEUpOw0KPiA+ICsJCX0NCj4gPiAgIAl9DQo+ID4NCj4gPiAgIAly
ID0gdmNlX3YzXzBfaHdfZmluaShhZGV2KTsNCj4gPg0K
