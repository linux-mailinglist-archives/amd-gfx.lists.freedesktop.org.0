Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69ED274D781
	for <lists+amd-gfx@lfdr.de>; Mon, 10 Jul 2023 15:29:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6CD910E173;
	Mon, 10 Jul 2023 13:29:15 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2055.outbound.protection.outlook.com [40.107.96.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7784610E173
 for <amd-gfx@lists.freedesktop.org>; Mon, 10 Jul 2023 13:29:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CcCdjmqNLSPLZd3nwt3nScat1G3TpvkLytdZSnUlixi58i0pal5DgNkwLKxSI5guFWs5ozB/qoFs8tSYpsXgYN5YyW1we/zuJ4mxzbZz0DHr5lt3e4S+wR6CajT7lhSDT7ZGEF8ENa9whZxyWadANzRyQ2V2ILAYIum5SPLBvkP7uZVtX8Mkw85dxcjBCA5red+EuDd/1nH1vAyL0VeEkk0E4Om8/JKqDGQRq8zDZLYapqv27/6HaUGRdUksy8OHt50aakz3Rp1qdLCjb3dwM9Nj03x9PV3YPo6UGAzgQhqFwtLHYFn1RufsqFZoHlX/NEl1OW2uhFBoKmSw56EEUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z2xCo9OPJum74ymwoXflzPRYKXU/ViSvnZrDwKHVhGM=;
 b=CPDqfmYzpR7lv76nyYoY1aLMwTWXnXh4M0Xe7GbtG7H61PjUEtuc564noCAm62aWezLj4MuyGuanfoC0+APLFeYfVqNN84eOM2Mc6n89rdWdTcCdKQG++hDO50YdtSuWA3Eej6+gnl00tc/1VAk+W6zWihYe9Lg2x9kfsc0Qp1CWX5wo/gxoAbwmEVsSubF08mZvvNUpHYKWzqBBAxsRxQ1KyIF2wqqLg8J33B7EohgGNHi4sf96TmMogzQRoObStdav5qJVLFgLvmvs9Huzv+iOqtr1fXz6pIXYBbHKiWRdXE5ajTJ05TPd/B0WLeAWT+bRhmt8HyYsnnKcYX5pcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z2xCo9OPJum74ymwoXflzPRYKXU/ViSvnZrDwKHVhGM=;
 b=BD3z6+aQR/keMqqBE+ODg6EBCB6SAQv76KKlqJ3FRCYBBUgjXaS4KAKxibRYRH0QY9ap4CvhX/9V+SR3rYTSq5O/QuPw3eE0eUqVLbNQKeS3BL7SuNRVfrzWfvgETmvqJrta+0sWDT6Nfvaw6nCvQIqZhBBrriHZvOA9htAyPR0=
Received: from BL3PR12MB6425.namprd12.prod.outlook.com (2603:10b6:208:3b4::7)
 by BL0PR12MB4947.namprd12.prod.outlook.com (2603:10b6:208:17d::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.31; Mon, 10 Jul
 2023 13:29:10 +0000
Received: from BL3PR12MB6425.namprd12.prod.outlook.com
 ([fe80::f135:615c:ba53:17f4]) by BL3PR12MB6425.namprd12.prod.outlook.com
 ([fe80::f135:615c:ba53:17f4%5]) with mapi id 15.20.6565.028; Mon, 10 Jul 2023
 13:29:10 +0000
Content-Type: multipart/mixed;
 boundary="_000_BL3PR12MB64255614B99289C3FE9D3100EE30ABL3PR12MB6425namp_"
From: "Joshi, Mukul" <Mukul.Joshi@amd.com>
To: "SHANMUGAM, SRINIVASAN" <SRINIVASAN.SHANMUGAM@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>, "Kuehling, Felix" <Felix.Kuehling@amd.com>,
 "Chen, Guchun" <Guchun.Chen@amd.com>
Subject: RE: [PATCH v3] drm/amdkfd: Fix stack size in 'amdgpu_amdkfd_unmap_hiq'
Thread-Topic: [PATCH v3] drm/amdkfd: Fix stack size in
 'amdgpu_amdkfd_unmap_hiq'
Thread-Index: AQHZst3piNkBMVqEvkeFN3b8/RzBXq+y/igQ
Date: Mon, 10 Jul 2023 13:29:10 +0000
Message-ID: <BL3PR12MB64255614B99289C3FE9D3100EE30A@BL3PR12MB6425.namprd12.prod.outlook.com>
References: <20230709150506.255846-1-srinivasan.shanmugam@amd.com>
 <20230710032223.274800-1-srinivasan.shanmugam@amd.com>
In-Reply-To: <20230710032223.274800-1-srinivasan.shanmugam@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: <BL3PR12MB64255614B99289C3FE9D3100EE30A@BL3PR12MB6425.namprd12.prod.outlook.com>
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ActionId=4a9ed5bb-1206-47d8-9dfb-14c4f990def1;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=0;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=true;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2023-07-10T13:25:08Z;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL3PR12MB6425:EE_|BL0PR12MB4947:EE_
x-ms-office365-filtering-correlation-id: c0960088-e6ea-4e96-1ad7-08db8149a520
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: faNETfL9F3WHAKpBLY8ezCz1cA/tCAj7Sg4OeWHiq5SanO2VO/lAZOVH1wO+6Z/91gTNvO6WiYUsvEPFQ2/2cRX/iDoMBwhvRCXawQe4W/DhQ1HtqUHiQWkJR7gdhlY0dKjRbZxwn7kA4kwg2hZ8JwhcRiPQQ47SBflMN9/H7GTA1FQRyyl/cYeC5LgZgqpWhULhfptygVg4gCzjDFUfWhRiefuVGZH3hdCuXW5RhE3aogl2T+JcTFc9KZTbLaKfEkcag/Nwd5su6qUT29vOIThpIwP1X8BBse35Tskxlsf+v0ih0Ss20UOm1tNiiGnjyBza3uU0vcPCXCzNsP9Hh+vdmGYLKA0rsTUlV/ixO6OAwmkHWsxbDFCR8evjhJ0CHUjgBeL0XmxxHiGdfp7MA57Qt4D0TZ48n+4xxwuCYKPFUit1A6c2t/qOXdPtFxj7KAIWkCR9SP3fBrMgfwPNGx9g+BM06Cs5+/snSnjftVqs3Nn86yQu4bIUtTgbYxMqL9KiAqAAtu1e9lwvwljMVM7N2v65OuATlq5D3WSlvX1vrQZqvMnv6OGUD02EEEXX1Uw7YWGwlT4/o5lQHigY+3RZeTehwHNHfACV96oRBi3nL1eZhg348aO3falH0CpQ
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR12MB6425.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(376002)(396003)(136003)(366004)(346002)(451199021)(7696005)(478600001)(76116006)(110136005)(54906003)(71200400001)(66574015)(83380400001)(33656002)(86362001)(38070700005)(55016003)(2906002)(66946007)(186003)(53546011)(6506007)(26005)(9686003)(966005)(38100700002)(122000001)(921005)(8936002)(66446008)(64756008)(6636002)(4326008)(66476007)(316002)(66556008)(41300700001)(8676002)(5660300002)(52536014);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?L3M0WlVQYmxLQ295Q3NQTm02MGZuZVh0YTBPYWRpeWhMY3FoL1Z3NHFoRlNs?=
 =?utf-8?B?L25oRUZ6RWlmaHFaV0xTMDUrK1V3Z3lFeWdGTkhuMmlWT1huK01BUyt4ZGVh?=
 =?utf-8?B?T2FyU1FOb0VTeTNNZDVPSzVqR2QrYS8xNVJtUmlSZjJVS2ZTYnhOdGhNVk1L?=
 =?utf-8?B?eXZhaU9MSHRKLzEwVnRoVjg2U0h0anVsaHJaVEFwckNwb1VLMTNkQ25GN09R?=
 =?utf-8?B?QjQ2QkRJMzVuWUlzZ1pJUGkwRS9QdmJuWGhHeXhyTnFlNzAxUUE1MXZSK1Yx?=
 =?utf-8?B?TjFnS3FJRUJDR1FiNVdsM0xPVXZ1QnVhTlZ4T0NabVZ6SjFBY1VyUURscWlE?=
 =?utf-8?B?Y3hQU1czcXk3R1k1SWlEUm85RGhpR2FVS0gzcldSWXVnaWJEVjBLMVZwVlpS?=
 =?utf-8?B?UDRuaUJCSURNVE8wK0lmMjRhcUVETzMyS01PbW4zdjQwbFNLSGVrWTVmcEV0?=
 =?utf-8?B?US9ETUtBbWlPRnBmeFRpNm11Wk54TDgzTVFEYmxQeUxoMCs4MVNtSmE0anRQ?=
 =?utf-8?B?TlZkSU9MdXdLYVJiMUhmVVJIQlhDbGxSSlZ3WENiTTczZ1lzNnJ5NFZVNUVX?=
 =?utf-8?B?T0lHRDRnRnJPaGc4cDM0eTRPcHUrN2tSbjZoOUxFVU5yTHdia3V2YmVxN2tE?=
 =?utf-8?B?WkVQcnA2WmdZc0c0MkJ2OElwL0grY3B4anorYmhZa1hiN21odzdzOE81bTBB?=
 =?utf-8?B?S0liNUZxcXAvTjI1VGxzNCtnNjEySTZYZ2hscVQ5M2xBUFVYeTdpVTRjL0Ni?=
 =?utf-8?B?YmVPaHRtY0xMOXV3S21NNkRwbTN1YzRtcGhXdldiRGxCdzB6VWF3c2RmUytk?=
 =?utf-8?B?VGdaUkQzUmNzU3Myb1plL1ZwT2dEdlhkK2hoaGJ4RytJTlVqVWJmQ2cxRmh2?=
 =?utf-8?B?ZHMxYzZJRlpFNWhUR09hZFdRNU41K2NUSUlzSTNrbThaOVo1TWxvd0hVQjQr?=
 =?utf-8?B?TnpHdHF2K3RuTVFmOHlFYmtKL2g0YWJZR1BSMVE5NkxSSTJNUjhuWmwzVVZw?=
 =?utf-8?B?cHhDS3hISndEc3E3T3ovODVpcTZyQ0c1dDgyQ0FFU0Jqem1HVDlLZVlSKzFP?=
 =?utf-8?B?V3VGRmpaQUc1aXVWNFlmVVZrOUd0aU1vRUZyajRyQUM5RENjSGtCOFVxQ3ZO?=
 =?utf-8?B?dXRRNU9yMEhqaGNDTW5tOElWanZFay83Q1RIbHpkcUt0TXhzNW9ackY0VnVs?=
 =?utf-8?B?aDd0dms5VkJhTks5M0MxSzJzVXBBWjA4UW1rYVhLTlhmWStFM1hvbm5SUTMy?=
 =?utf-8?B?U3U2UCtpUksvUnU4b0hNZEpvYk01VFFmSjhRek82ckN4a0JaemlTam1BT3pC?=
 =?utf-8?B?TUw3OU1ReHNGaXdIWGlub3NIUDFEZXNZTzhZZitMdXQwU1ljKzJLbm5KdW4z?=
 =?utf-8?B?ZVZJekQ0R3hXSkcvb0hMamxnajBMMEQ2YVYycW5vK3cxM1p0Mnl4QnNhMDlP?=
 =?utf-8?B?b2hTQlNURnZsdXFGL3hXT1p4RlN6a2NWUE5ETFpzeXZJc1ZKZXNobzJjdW5o?=
 =?utf-8?B?a0R5WG96cVk5RGR0QkZ1ZlBMMUYrdzhxZngyNkpZQjdDMDVpNW1ROHdPYVNT?=
 =?utf-8?B?T0JMNGRIZUh1Tzg1Q1BhOGgvSXhuTERJcnllZWQ3OHMwdlJGQThUd1dTTVV3?=
 =?utf-8?B?ckVmekVBT1VUMUYvbDl2dXpORmtnNlVZTGJVcEF6WDJZY0NVOWMySGthMjhx?=
 =?utf-8?B?UC96anNEWGlsSEN0dUpHckRYb2hLUHFLRXQrV1ZycGc1Y3R5eEkxV1hoQmdp?=
 =?utf-8?B?TFpYOTZERjFIeE40THBSTEtmQm5UV3daRHQ2MWNNT0V5dWZkRC9CTERyQVJF?=
 =?utf-8?B?NkRVZDNpRUxBV1lIZzVXMCttN1VUbytBWWJ2WFF2KzFQTC9BOEIrSkdvQUZn?=
 =?utf-8?B?Y05yQWZkRGswTE0rbWNEblJsQURDbENuMG10Wkx0NGNnUXZHVWVIQUpzblpi?=
 =?utf-8?B?bzZHSllsTXJwMG1EeFdxeDJJQlVZVVdPa3lYdmNxYUJOKysvaDk5dXhHTWQ5?=
 =?utf-8?B?Wk5XR3NwcUhzT0hlWGRHaWZzajZja0hhZ3paaERzcGUwSEVtUDRBUlZoSDBh?=
 =?utf-8?B?VXBWT3ZDbTB2emdtV1phYit2V0dYUEJCWWpLME1Gd1VEbkVXR3RYb3hYTy9F?=
 =?utf-8?Q?d6Hw=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL3PR12MB6425.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0960088-e6ea-4e96-1ad7-08db8149a520
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jul 2023 13:29:10.5494 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mC8j05bWXtYDXRXvy6vQlB/MT8albvHISRUqXNnQi5/ECg9vHWNGIS16Hg1cEM82IMpY7mcftPYqro4avpqXFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4947
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
Cc: "SHANMUGAM, SRINIVASAN" <SRINIVASAN.SHANMUGAM@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--_000_BL3PR12MB64255614B99289C3FE9D3100EE30ABL3PR12MB6425namp_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

W0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEdlbmVyYWxdDQoNClRoYW5rcyBmb3IgbG9va2luZyBp
bnRvIHRoaXMuDQpJIGdvdCBhbiBlbWFpbCBhYm91dCB0aGlzIGZyb20ga2VybmVsIHRlc3Qgcm9i
b3QsIGNhbiB5b3UgYWRkIHRoaXMgYWxzbyB0byB0aGUgY29tbWl0IG1lc3NhZ2U6DQpSZXBvcnRl
ZC1ieToga2VybmVsIHRlc3Qgcm9ib3QgPGxrcEBpbnRlbC5jb20+DQpDbG9zZXM6IGh0dHBzOi8v
bG9yZS5rZXJuZWwub3JnL29lLWtidWlsZC1hbGwvMjAyMzA3MDgwNTA1LlYxMnFTMG96LWxrcEBp
bnRlbC5jb20NCg0KDQpSZXZpZXdlZC1ieTogTXVrdWwgSm9zaGkgPG11a3VsLmpvc2hpQGFtZC5j
b20+DQoNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBhbWQtZ2Z4IDxh
bWQtZ2Z4LWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YNCj4gU3Jp
bml2YXNhbiBTaGFubXVnYW0NCj4gU2VudDogU3VuZGF5LCBKdWx5IDksIDIwMjMgMTE6MjIgUE0N
Cj4gVG86IEtvZW5pZywgQ2hyaXN0aWFuIDxDaHJpc3RpYW4uS29lbmlnQGFtZC5jb20+OyBEZXVj
aGVyLCBBbGV4YW5kZXINCj4gPEFsZXhhbmRlci5EZXVjaGVyQGFtZC5jb20+OyBLdWVobGluZywg
RmVsaXggPEZlbGl4Lkt1ZWhsaW5nQGFtZC5jb20+Ow0KPiBDaGVuLCBHdWNodW4gPEd1Y2h1bi5D
aGVuQGFtZC5jb20+DQo+IENjOiBTSEFOTVVHQU0sIFNSSU5JVkFTQU4gPFNSSU5JVkFTQU4uU0hB
Tk1VR0FNQGFtZC5jb20+Ow0KPiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBTdWJq
ZWN0OiBbUEFUQ0ggdjNdIGRybS9hbWRrZmQ6IEZpeCBzdGFjayBzaXplIGluDQo+ICdhbWRncHVf
YW1ka2ZkX3VubWFwX2hpcScNCj4NCj4gQ2F1dGlvbjogVGhpcyBtZXNzYWdlIG9yaWdpbmF0ZWQg
ZnJvbSBhbiBFeHRlcm5hbCBTb3VyY2UuIFVzZSBwcm9wZXIgY2F1dGlvbg0KPiB3aGVuIG9wZW5p
bmcgYXR0YWNobWVudHMsIGNsaWNraW5nIGxpbmtzLCBvciByZXNwb25kaW5nLg0KPg0KPg0KPiBB
bGxvY2F0ZSBsYXJnZSBsb2NhbCB2YXJpYWJsZSBvbiBoZWFwIHRvIGF2b2lkIGV4Y2VlZGluZyB0
aGUgc3RhY2sgc2l6ZToNCj4gZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2FtZGtm
ZC5jOiBJbiBmdW5jdGlvbg0KPiDigJhhbWRncHVfYW1ka2ZkX3VubWFwX2hpceKAmToNCj4gZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2FtZGtmZC5jOjg2ODoxOiB3YXJuaW5nOiB0
aGUNCj4gZnJhbWUgc2l6ZSBvZiAxMjgwIGJ5dGVzIGlzIGxhcmdlciB0aGFuIDEwMjQgYnl0ZXMg
Wy1XZnJhbWUtbGFyZ2VyLXRoYW49XQ0KPg0KPiBTdWdnZXN0ZWQtYnk6IEd1Y2h1biBDaGVuIDxn
dWNodW4uY2hlbkBhbWQuY29tPg0KPiBDYzogRmVsaXggS3VlaGxpbmcgPEZlbGl4Lkt1ZWhsaW5n
QGFtZC5jb20+DQo+IENjOiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5j
b20+DQo+IENjOiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+DQo+IFNp
Z25lZC1vZmYtYnk6IFNyaW5pdmFzYW4gU2hhbm11Z2FtIDxzcmluaXZhc2FuLnNoYW5tdWdhbUBh
bWQuY29tPg0KPiAtLS0NCj4NCj4gdjM6DQo+ICAtIGZyZWUgcmluZ19mdW5jcyBiZWZvcmUgJ3Jl
dHVybiAtRU5PTUVNJyAoR3VjaHVuKS4NCj4gIC0ga2VlcCB0aGUgY2hlY2sgb2YgJyBraXEtPnBt
ZicgYW5kICdraXEtPnBtZi0+a2lxX3VubWFwX3F1ZXVlcycgYWhlYWQNCj4gICAgb2YgYWxsb2Nh
dGlvbiBvZiByaW5nICYgcmluZ19mdW5jcyAoR3VjaHVuKS4NCj4NCj4gIGRyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV9hbWRrZmQuYyB8IDMyDQo+ICsrKysrKysrKysrKysrKystLS0t
LS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAyMyBpbnNlcnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQ0K
Pg0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2FtZGtm
ZC5jDQo+IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2FtZGtmZC5jDQo+IGlu
ZGV4IDAwNDBjNjNlMjM1Ni4uNjI5Y2ExYWQ3NWE4IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYW1ka2ZkLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X2FtZGtmZC5jDQo+IEBAIC04MzYsMzMgKzgzNiw0NyBAQCBpbnQg
YW1kZ3B1X2FtZGtmZF91bm1hcF9oaXEoc3RydWN0DQo+IGFtZGdwdV9kZXZpY2UgKmFkZXYsIHUz
MiBkb29yYmVsbF9vZmYsICB7DQo+ICAgICAgICAgc3RydWN0IGFtZGdwdV9raXEgKmtpcSA9ICZh
ZGV2LT5nZngua2lxW2luc3RdOw0KPiAgICAgICAgIHN0cnVjdCBhbWRncHVfcmluZyAqa2lxX3Jp
bmcgPSAma2lxLT5yaW5nOw0KPiAtICAgICAgIHN0cnVjdCBhbWRncHVfcmluZ19mdW5jcyByaW5n
X2Z1bmNzOw0KPiAtICAgICAgIHN0cnVjdCBhbWRncHVfcmluZyByaW5nOw0KPiArICAgICAgIHN0
cnVjdCBhbWRncHVfcmluZ19mdW5jcyAqcmluZ19mdW5jczsNCj4gKyAgICAgICBzdHJ1Y3QgYW1k
Z3B1X3JpbmcgKnJpbmc7DQo+ICAgICAgICAgaW50IHIgPSAwOw0KPg0KPiAgICAgICAgIGlmICgh
a2lxLT5wbWYgfHwgIWtpcS0+cG1mLT5raXFfdW5tYXBfcXVldWVzKQ0KPiAgICAgICAgICAgICAg
ICAgcmV0dXJuIC1FSU5WQUw7DQo+DQo+IC0gICAgICAgbWVtc2V0KCZyaW5nLCAweDAsIHNpemVv
ZihzdHJ1Y3QgYW1kZ3B1X3JpbmcpKTsNCj4gLSAgICAgICBtZW1zZXQoJnJpbmdfZnVuY3MsIDB4
MCwgc2l6ZW9mKHN0cnVjdCBhbWRncHVfcmluZ19mdW5jcykpOw0KPiArICAgICAgIHJpbmdfZnVu
Y3MgPSBremFsbG9jKHNpemVvZigqcmluZ19mdW5jcyksIEdGUF9LRVJORUwpOw0KPiArICAgICAg
IGlmICghcmluZ19mdW5jcykNCj4gKyAgICAgICAgICAgICAgIHJldHVybiAtRU5PTUVNOw0KPiAr
DQo+ICsgICAgICAgcmluZyA9IGt6YWxsb2Moc2l6ZW9mKCpyaW5nKSwgR0ZQX0tFUk5FTCk7DQo+
ICsgICAgICAgaWYgKCFyaW5nKSB7DQo+ICsgICAgICAgICAgICAgICByID0gLUVOT01FTTsNCj4g
KyAgICAgICAgICAgICAgIGdvdG8gZnJlZV9yaW5nX2Z1bmNzOw0KPiArICAgICAgIH0NCj4NCj4g
LSAgICAgICByaW5nX2Z1bmNzLnR5cGUgPSBBTURHUFVfUklOR19UWVBFX0NPTVBVVEU7DQo+IC0g
ICAgICAgcmluZy5kb29yYmVsbF9pbmRleCA9IGRvb3JiZWxsX29mZjsNCj4gLSAgICAgICByaW5n
LmZ1bmNzID0gJnJpbmdfZnVuY3M7DQo+ICsgICAgICAgcmluZ19mdW5jcy0+dHlwZSA9IEFNREdQ
VV9SSU5HX1RZUEVfQ09NUFVURTsNCj4gKyAgICAgICByaW5nLT5kb29yYmVsbF9pbmRleCA9IGRv
b3JiZWxsX29mZjsNCj4gKyAgICAgICByaW5nLT5mdW5jcyA9IHJpbmdfZnVuY3M7DQo+DQo+ICAg
ICAgICAgc3Bpbl9sb2NrKCZraXEtPnJpbmdfbG9jayk7DQo+DQo+ICAgICAgICAgaWYgKGFtZGdw
dV9yaW5nX2FsbG9jKGtpcV9yaW5nLCBraXEtPnBtZi0+dW5tYXBfcXVldWVzX3NpemUpKSB7DQo+
ICAgICAgICAgICAgICAgICBzcGluX3VubG9jaygma2lxLT5yaW5nX2xvY2spOw0KPiAtICAgICAg
ICAgICAgICAgcmV0dXJuIC1FTk9NRU07DQo+ICsgICAgICAgICAgICAgICByID0gLUVOT01FTTsN
Cj4gKyAgICAgICAgICAgICAgIGdvdG8gZnJlZV9yaW5nOw0KPiAgICAgICAgIH0NCj4NCj4gLSAg
ICAgICBraXEtPnBtZi0+a2lxX3VubWFwX3F1ZXVlcyhraXFfcmluZywgJnJpbmcsIFJFU0VUX1FV
RVVFUywgMCwgMCk7DQo+ICsgICAgICAga2lxLT5wbWYtPmtpcV91bm1hcF9xdWV1ZXMoa2lxX3Jp
bmcsIHJpbmcsIFJFU0VUX1FVRVVFUywgMCwgMCk7DQo+DQo+ICAgICAgICAgaWYgKGtpcV9yaW5n
LT5zY2hlZC5yZWFkeSAmJiAhYWRldi0+am9iX2hhbmcpDQo+ICAgICAgICAgICAgICAgICByID0g
YW1kZ3B1X3JpbmdfdGVzdF9oZWxwZXIoa2lxX3JpbmcpOw0KPg0KPiAgICAgICAgIHNwaW5fdW5s
b2NrKCZraXEtPnJpbmdfbG9jayk7DQo+DQo+ICtmcmVlX3Jpbmc6DQo+ICsgICAgICAga2ZyZWUo
cmluZyk7DQo+ICsNCj4gK2ZyZWVfcmluZ19mdW5jczoNCj4gKyAgICAgICBrZnJlZShyaW5nX2Z1
bmNzKTsNCj4gKw0KPiAgICAgICAgIHJldHVybiByOw0KPiAgfQ0KPiAtLQ0KPiAyLjI1LjENCg0K

--_000_BL3PR12MB64255614B99289C3FE9D3100EE30ABL3PR12MB6425namp_
Content-Disposition: attachment; filename="winmail.dat"
Content-Transfer-Encoding: base64
Content-Type: application/ms-tnef; name="winmail.dat"

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
AGQALgBjAG8AbQAAAB8AZAABAAAACgAAAFMATQBUAFAAAAAAAAIBQQABAAAAZAAAAAAAAACBKx+k
vqMQGZ1uAN0BD1QCAAAAgEoAbwBzAGgAaQAsACAATQB1AGsAdQBsAAAAUwBNAFQAUAAAAE0AdQBr
AHUAbAAuAEoAbwBzAGgAaQBAAGEAbQBkAC4AYwBvAG0AAAAfAAJdAQAAACgAAABNAHUAawB1AGwA
LgBKAG8AcwBoAGkAQABhAG0AZAAuAGMAbwBtAAAAHwDlXwEAAAAwAAAAcwBpAHAAOgBtAHUAawB1
AGwALgBqAG8AcwBoAGkAQABhAG0AZAAuAGMAbwBtAAAAHwAaDAEAAAAaAAAASgBvAHMAaABpACwA
IABNAHUAawB1AGwAAAAAAB8AHwwBAAAAKAAAAE0AdQBrAHUAbAAuAEoAbwBzAGgAaQBAAGEAbQBk
AC4AYwBvAG0AAAAfAB4MAQAAAAoAAABTAE0AVABQAAAAAAACARkMAQAAAGQAAAAAAAAAgSsfpL6j
EBmdbgDdAQ9UAgAAAIBKAG8AcwBoAGkALAAgAE0AdQBrAHUAbAAAAFMATQBUAFAAAABNAHUAawB1
AGwALgBKAG8AcwBoAGkAQABhAG0AZAAuAGMAbwBtAAAAHwABXQEAAAAoAAAATQB1AGsAdQBsAC4A
SgBvAHMAaABpAEAAYQBtAGQALgBjAG8AbQAAAAsAQDoBAAAAHwAaAAEAAAASAAAASQBQAE0ALgBO
AG8AdABlAAAAAAADAPE/CQQAAAsAQDoBAAAAAwD9P+QEAAACAQswAQAAABAAAADP7FeNNQoxSJab
g9wSI8ZEAwAXAAEAAABAADkAAJdNgjKz2QFAAAgwfCifgjKz2QELACkAAAAAAB8A2T8BAAAAAAIA
AFQAaABhAG4AawBzACAAZgBvAHIAIABsAG8AbwBrAGkAbgBnACAAaQBuAHQAbwAgAHQAaABpAHMA
LgANAAoASQAgAGcAbwB0ACAAYQBuACAAZQBtAGEAaQBsACAAYQBiAG8AdQB0ACAAdABoAGkAcwAg
AGYAcgBvAG0AIABrAGUAcgBuAGUAbAAgAHQAZQBzAHQAIAByAG8AYgBvAHQALAAgAGMAYQBuACAA
eQBvAHUAIABhAGQAZAAgAHQAaABpAHMAIABhAGwAcwBvACAAdABvACAAdABoAGUAIABjAG8AbQBt
AGkAdAAgAG0AZQBzAHMAYQBnAGUAOgANAAoAUgBlAHAAbwByAHQAZQBkAC0AYgB5ADoAIABrAGUA
cgBuAGUAbAAgAHQAZQBzAHQAIAByAG8AYgBvAHQAIAA8AGwAawBwAEAAaQBuAHQAZQBsAC4AYwBv
AG0APgANAAoAQwBsAG8AcwBlAHMAOgAgAGgAdAB0AHAAcwA6AC8ALwBsAG8AcgBlAC4AawBlAHIA
bgBlAGwALgBvAHIAZwAvAG8AZQAtAGsAYgB1AGkAbABkAC0AYQBsAGwALwAyADAAMgAzADAANwAw
ADgAMAA1ADAANQAuAFYAMQAyAHEAUwAwAG8AegAtAGwAawBwAEAAaQBuAHQAZQBsAC4AYwBvAAAA
CwAAgAggBgAAAAAAwAAAAAAAAEYAAAAAFIUAAAAAAAALACMAAAAAAB8AAICGAwIAAAAAAMAAAAAA
AABGAQAAAB4AAABhAGMAYwBlAHAAdABsAGEAbgBnAHUAYQBnAGUAAAAAAAEAAAAMAAAAZQBuAC0A
VQBTAAAAAwAAgAggBgAAAAAAwAAAAAAAAEYBAAAAMgAAAEUAeABjAGgAYQBuAGcAZQBBAHAAcABs
AGkAYwBhAHQAaQBvAG4ARgBsAGEAZwBzAAAAAAAgAAAASAAAgAggBgAAAAAAwAAAAAAAAEYBAAAA
IgAAAE4AZQB0AHcAbwByAGsATQBlAHMAcwBhAGcAZQBJAGQAAAAAAIgAlsDq5pZOGtcI24FJpSAf
AACAE4/yQfSDFEGlhO7bWmsL/wEAAAAWAAAAQwBsAGkAZQBuAHQASQBuAGYAbwAAAAAAAQAAACoA
AABDAGwAaQBlAG4AdAA9AE0AUwBFAHgAYwBoAGEAbgBnAGUAUgBQAEMAAAAAAB8AAICGAwIAAAAA
AMAAAAAAAABGAQAAABgAAABtAHMAaQBwAF8AbABhAGIAZQBsAHMAAAABAAAAAAQAAE0AUwBJAFAA
XwBMAGEAYgBlAGwAXwA0ADMANAAyADMAMQA0AGUALQAwAGQAZgA0AC0ANABiADUAOAAtADgANABi
AGYALQAzADgAYgBlAGQANgAxADcAMABhADAAZgBfAEEAYwB0AGkAbwBuAEkAZAA9ADQAYQA5AGUA
ZAA1AGIAYgAtADEAMgAwADYALQA0ADcAZAA4AC0AOQBkAGYAYgAtADEANABjADQAZgA5ADkAMABk
AGUAZgAxADsATQBTAEkAUABfAEwAYQBiAGUAbABfADQAMwA0ADIAMwAxADQAZQAtADAAZABmADQA
LQA0AGIANQA4AC0AOAA0AGIAZgAtADMAOABiAGUAZAA2ADEANwAwAGEAMABmAF8AQwBvAG4AdABl
AG4AdABCAGkAdABzAD0AMAA7AE0AUwBJAFAAXwBMAGEAYgBlAGwAXwA0ADMANAAyADMAMQA0AGUA
LQAwAGQAZgA0AC0ANABiADUAOAAtADgANABiAGYALQAzADgAYgBlAGQANgAxADcAMABhADAAZgBf
AEUAbgBhAGIAbABlAGQAPQB0AHIAdQBlADsATQBTAEkAUABfAEwAYQBiAGUAbABfADQAMwA0ADIA
MwAxADQAZQAtADAAZABmADQALQA0AGIANQA4AC0AOAA0AGIAZgAtADMAOABiAGUAZAA2ADEANwAw
AGEAMABmAF8ATQBlAHQAaABvAGQAPQBTAHQAYQBuAGQAYQByAGQAOwBNAFMASQBQAF8ATABhAGIA
ZQBsAF8ANAAzADQAMgAzADEANABlAC0AMABkAGYANAAtADQAYgA1ADgALQA4ADQAYgBmAC0AMwA4
AGIAZQBkADYAMQA3ADAAYQAwAGYAXwBOAGEAbQBlAD0ARwBlAG4AZQByAGEAbAA7AE0AUwBJAFAA
XwBMAGEAYgBlAGwAXwA0ADMANAAyADMAMQA0AGUALQAwAGQAZgA0AC0ANABiADUAOAAtADgANABi
AGYALQAzADgAYgBlAGQANgAxADcAMABhADAAZgBfAFMAZQB0AEQAYQB0AGUAPQAyADAAMgAzAC0A
MAA3AC0AMQAwAFQAMQAzADoAMgA1ADoAMAA4AFoAOwBNAFMASQBQAF8ATABhAGIAZQBsAF8ANAAz
ADQAMgAzADEANABlAC0AMABkAGYANAAtADQAYgA1ADgALQA4ADQAYgBmAC0AMwA4AGIAZQBkADYA
MQA3ADAAYQAwAGYAXwBTAGkAdABlAEkAZAA9ADMAZABkADgAOQA2ADEAZgAtAGUANAA4ADgALQA0
AGUANgAwAC0AOABlADEAMQAtAGEAOAAyAGQAOQA5ADQAZQAxADgAMwBkADsAAABIAACAa8U/QDDN
xUeG+O3p41oCKwEAAAAcAAAATQBTAEkAUABMAGEAYgBlAGwARwB1AGkAZAAAAE4xQkP0DVhLhL84
vtYXCg8fAPo/AQAAABoAAABKAG8AcwBoAGkALAAgAE0AdQBrAHUAbAAAAAAACwAAgAggBgAAAAAA
wAAAAAAAAEYAAAAABoUAAAAAAAAfADcAAQAAAI4AAABSAEUAOgAgAFsAUABBAFQAQwBIACAAdgAz
AF0AIABkAHIAbQAvAGEAbQBkAGsAZgBkADoAIABGAGkAeAAgAHMAdABhAGMAawAgAHMAaQB6AGUA
IABpAG4AIAAnAGEAbQBkAGcAcAB1AF8AYQBtAGQAawBmAGQAXwB1AG4AbQBhAHAAXwBoAGkAcQAn
AAAAAAAfAD0AAQAAAAoAAABSAEUAOgAgAAAAAAADADYAAAAAAAMALgAAAAAAHwBCEAEAAABuAAAA
PAAyADAAMgAzADAANwAxADAAMAAzADIAMgAyADMALgAyADcANAA4ADAAMAAtADEALQBzAHIAaQBu
AGkAdgBhAHMAYQBuAC4AcwBoAGEAbgBtAHUAZwBhAG0AQABhAG0AZAAuAGMAbwBtAD4AAAAAAAIB
cQABAAAAGwAAAAEB2bLd6YjZATFahL5HhTd2/P0cwV6vsv4oEAAfAHAAAQAAAIYAAABbAFAAQQBU
AEMASAAgAHYAMwBdACAAZAByAG0ALwBhAG0AZABrAGYAZAA6ACAARgBpAHgAIABzAHQAYQBjAGsA
IABzAGkAegBlACAAaQBuACAAJwBhAG0AZABnAHAAdQBfAGEAbQBkAGsAZgBkAF8AdQBuAG0AYQBw
AF8AaABpAHEAJwAAAAAAHwA1EAEAAACiAAAAPABCAEwAMwBQAFIAMQAyAE0AQgA2ADQAMgA1ADUA
NgAxADQAQgA5ADkAMgA4ADkAQwAzAEYARQA5AEQAMwAxADAAMABFAEUAMwAwAEEAQABCAEwAMwBQ
AFIAMQAyAE0AQgA2ADQAMgA1AC4AbgBhAG0AcAByAGQAMQAyAC4AcAByAG8AZAAuAG8AdQB0AGwA
bwBvAGsALgBjAG8AbQA+AAAAAAAfADkQAQAAANwAAAA8ADIAMAAyADMAMAA3ADAAOQAxADUAMAA1
ADAANgAuADIANQA1ADgANAA2AC0AMQAtAHMAcgBpAG4AaQB2AGEAcwBhAG4ALgBzAGgAYQBuAG0A
dQBnAGEAbQBAAGEAbQBkAC4AYwBvAG0APgAgADwAMgAwADIAMwAwADcAMQAwADAAMwAyADIAMgAz
AC4AMgA3ADQAOAAwADAALQAxAC0AcwByAGkAbgBpAHYAYQBzAGEAbgAuAHMAaABhAG4AbQB1AGcA
YQBtAEAAYQBtAGQALgBjAG8AbQA+AAAAAwDeP+n9AAALAACACCAGAAAAAADAAAAAAAAARgAAAAAD
hQAAAAAAAAMAAIAIIAYAAAAAAMAAAAAAAABGAAAAAAGFAAAAAAAAAwCAEP////8DABMSAAAAAAIB
AIATj/JB9IMUQaWE7ttaawv/AQAAAC4AAABIAGUAYQBkAGUAcgBCAG8AZAB5AEYAcgBhAGcAbQBl
AG4AdABMAGkAcwB0AAAAAAABAAAAIgAAAAEACgAAAAQAAAAAAAAAFAAAAAAAAAAAAAAA/////wAA
AAAAAAsAAIATj/JB9IMUQaWE7ttaawv/AQAAABwAAABIAGEAcwBRAHUAbwB0AGUAZABUAGUAeAB0
AAAAAAAAAAsAAIATj/JB9IMUQaWE7ttaawv/AQAAACgAAABJAHMAUQB1AG8AdABlAGQAVABlAHgA
dABDAGgAYQBuAGcAZQBkAAAAAQAAAAIBAIATj/JB9IMUQaWE7ttaawv/AQAAAEAAAABDAG8AbgB2
AGUAcgBzAGEAdABpAG8AbgBUAHIAZQBlAFAAYQByAGUAbgB0AFIAZQBjAG8AcgBkAEsAZQB5AAAA
AQAAAC4AAAAAAAAAFEjHYmmst0eF/y4LwtdKiQEAoUtSeTXDTUeTWsEY/uDx+AADGLBKDwAAAABA
AAcwSE59gjKz2QELAAIAAQAAAAMAJgAAAAAACwArAAAAAAALAAYMAAAAAAIBEDABAAAARgAAAAAA
AAAUSMdiaay3R4X/LgvC10qJBwChS1J5NcNNR5NawRj+4PH4AAAAAAELAAChS1J5NcNNR5NawRj+
4PH4AAMP1L3+AAAAAAIBEzABAAAAEAAAAIjZATFahL5HhTd2/P0cwV4CARQwAQAAAAwAAAApAQAA
qdNTk1QAAAADAFszAQAAAAMAWjYAAAAAAwBoNg0AAAALAPo2AQAAAB8A+D8BAAAAGgAAAEoAbwBz
AGgAaQAsACAATQB1AGsAdQBsAAAAAAAfACJAAQAAAAYAAABFAFgAAAAAAB8AI0ABAAAAAgEAAC8A
TwA9AEUAWABDAEgAQQBOAEcARQBMAEEAQgBTAC8ATwBVAD0ARQBYAEMASABBAE4ARwBFACAAQQBE
AE0ASQBOAEkAUwBUAFIAQQBUAEkAVgBFACAARwBSAE8AVQBQACAAKABGAFkARABJAEIATwBIAEYA
MgAzAFMAUABEAEwAVAApAC8AQwBOAD0AUgBFAEMASQBQAEkARQBOAFQAUwAvAEMATgA9ADUARQBB
AEUAQwA5AEQANwA0ADcANAA0ADQANwAwADAAQQAzAEUANABBADgAMABGADQARgBEADQAOAAyAEMA
RQAtAEoATwBTAEgASQAsACAATQBVAEsAVQAAAAAAHwAkQAEAAAAGAAAARQBYAAAAAAAfACVAAQAA
AAIBAAAvAE8APQBFAFgAQwBIAEEATgBHAEUATABBAEIAUwAvAE8AVQA9AEUAWABDAEgAQQBOAEcA
RQAgAEEARABNAEkATgBJAFMAVABSAEEAVABJAFYARQAgAEcAUgBPAFUAUAAgACgARgBZAEQASQBC
AE8ASABGADIAMwBTAFAARABMAFQAKQAvAEMATgA9AFIARQBDAEkAUABJAEUATgBUAFMALwBDAE4A
PQA1AEUAQQBFAEMAOQBEADcANAA3ADQANAA0ADcAMAAwAEEAMwBFADQAQQA4ADAARgA0AEYARAA0
ADgAMgBDAEUALQBKAE8AUwBIAEkALAAgAE0AVQBLAFUAAAAAAB8AMEABAAAAGgAAAEoAbwBzAGgA
aQAsACAATQB1AGsAdQBsAAAAAAAfADFAAQAAABoAAABKAG8AcwBoAGkALAAgAE0AdQBrAHUAbAAA
AAAAHwA4QAEAAAAaAAAASgBvAHMAaABpACwAIABNAHUAawB1AGwAAAAAAB8AOUABAAAAGgAAAEoA
bwBzAGgAaQAsACAATQB1AGsAdQBsAAAAAAADAFlAAAAAAAMAWkAAAAAAAwA3UAEAAAADAAlZAQAA
AB8ACl0BAAAAKAAAAE0AdQBrAHUAbAAuAEoAbwBzAGgAaQBAAGEAbQBkAC4AYwBvAG0AAAAfAAtd
AQAAACgAAABNAHUAawB1AGwALgBKAG8AcwBoAGkAQABhAG0AZAAuAGMAbwBtAAAAAgEVXQEAAAAS
AAAAAh+W2D2I5GBOjhGoLZlOGD0BAAACARZdAQAAABIAAAACH5bYPYjkYE6OEagtmU4YPQEAAAMA
AIBQ42MLzJzQEbzbAIBfzM4EAQAAACQAAABJAG4AZABlAHgAaQBuAGcARQByAHIAbwByAEMAbwBk
AGUAAAAbAAAAHwAAgFDjYwvMnNARvNsAgF/MzgQBAAAAKgAAAEkAbgBkAGUAeABpAG4AZwBFAHIA
cgBvAHIATQBlAHMAcwBhAGcAZQAAAAAAAQAAAHAAAABJAG4AZABlAHgAaQBuAGcAIABQAGUAbgBk
AGkAbgBnACAAdwBoAGkAbABlACAAQgBpAGcARgB1AG4AbgBlAGwAUABPAEkASQBzAFUAcABUAG8A
RABhAHQAZQAgAGkAcwAgAGYAYQBsAHMAZQAuAAAACwAAgFDjYwvMnNARvNsAgF/MzgQBAAAAJgAA
AEkAcwBQAGUAcgBtAGEAbgBlAG4AdABGAGEAaQBsAHUAcgBlAAAAAAAAAAAAHwAAgB+k6zOoei5C
vnt54amOVLMBAAAAOAAAAEMAbwBuAHYAZQByAHMAYQB0AGkAbwBuAEkAbgBkAGUAeABUAHIAYQBj
AGsAaQBuAGcARQB4AAAAAQAAAAACAABJAEkAPQBbAEMASQBEAD0AMwAxADAAMQBkADkAOAA4AC0A
OAA0ADUAYQAtADQANwBiAGUALQA4ADUAMwA3AC0ANwA2AGYAYwBmAGQAMQBjAGMAMQA1AGUAOwBJ
AEQAWABIAEUAQQBEAD0AMAAxAEQAOQBCADIARABEAEUAOQA7AEkARABYAEMATwBVAE4AVAA9ADIA
XQA7AFMAQgBNAEkARAA9ADUAOQA7AFMAMQA9ADwAMgAwADIAMwAwADcAMQAwADAAMwAyADIAMgAz
AC4AMgA3ADQAOAAwADAALQAxAC0AcwByAGkAbgBpAHYAYQBzAGEAbgAuAHMAaABhAG4AbQB1AGcA
YQBtAEAAYQBtAGQALgBjAG8AbQA+ADsAUgBUAFAAPQBEAGkAcgBlAGMAdABDAGgAaQBsAGQAOwBU
AEQATgA9AFIAZQBtAG8AdgBlAGQAOwBUAEYAUgA9AFAAYQByAHQAaQBjAGkAcABhAG4AdABDAGgA
YQBuAGcAZQBkADsAVgBlAHIAcwBpAG8AbgA9AFYAZQByAHMAaQBvAG4AIAAxADUALgAyADAAIAAo
AEIAdQBpAGwAZAAgADYANQA2ADUALgAwACkALAAgAFMAdABhAGcAZQA9AEgAMQAsACAAVABDADsA
VQBQAD0ANQAwADsARABQAD0AMQAAAAMAAIAIIAYAAAAAAMAAAAAAAABGAAAAABCFAAAAAAAACwAA
gAggBgAAAAAAwAAAAAAAAEYAAAAADoUAAAAAAABAAACACCAGAAAAAADAAAAAAAAARgAAAAC/hQAA
4EvUYTKz2QELAACACCAGAAAAAADAAAAAAAAARgAAAACChQAAAAAAAAMAAIAIIAYAAAAAAMAAAAAA
AABGAAAAABiFAAAAAAAAAgEAgAggBgAAAAAAwAAAAAAAAEYBAAAANgAAAEkAbgBUAHIAYQBuAHMA
aQB0AE0AZQBzAHMAYQBnAGUAQwBvAHIAcgBlAGwAYQB0AG8AcgAAAAAAAQAAABAAAADx1Z2b1F1v
RpHe9WLfXesyHwAAgAggBgAAAAAAwAAAAAAAAEYAAAAA2IUAAAEAAAASAAAASQBQAE0ALgBOAG8A
dABlAAAAAAADAA00/T8AAB8AAICGAwIAAAAAAMAAAAAAAABGAQAAAC4AAABhAHUAdABoAGUAbgB0
AGkAYwBhAHQAaQBvAG4ALQByAGUAcwB1AGwAdABzAAAAAAABAAAAsgAAAGQAawBpAG0APQBuAG8A
bgBlACAAKABtAGUAcwBzAGEAZwBlACAAbgBvAHQAIABzAGkAZwBuAGUAZAApACAAaABlAGEAZABl
AHIALgBkAD0AbgBvAG4AZQA7AGQAbQBhAHIAYwA9AG4AbwBuAGUAIABhAGMAdABpAG8AbgA9AG4A
bwBuAGUAIABoAGUAYQBkAGUAcgAuAGYAcgBvAG0APQBhAG0AZAAuAGMAbwBtADsAAAAAAB8AAICG
AwIAAAAAAMAAAAAAAABGAQAAACAAAAB4AC0AbQBzAC0AaABhAHMALQBhAHQAdABhAGMAaAAAAAEA
AAACAAAAAAAAAB8AAIBrxT9AMM3FR4b47enjWgIrAQAAABIAAABNAEkAUABMAGEAYgBlAGwAAAAA
AAEAAADMAQAAWwB7ACIAaQBkACIAOgAiADQAMwA0ADIAMwAxADQAZQAtADAAZABmADQALQA0AGIA
NQA4AC0AOAA0AGIAZgAtADMAOABiAGUAZAA2ADEANwAwAGEAMABmACIALAAiAHQAaQAiADoAIgAz
AGQAZAA4ADkANgAxAGYALQBlADQAOAA4AC0ANABlADYAMAAtADgAZQAxADEALQBhADgAMgBkADkA
OQA0AGUAMQA4ADMAZAAiACwAIgBwAGkAIgA6ACIAMAAwADAAMAAwADAAMAAwAC0AMAAwADAAMAAt
ADAAMAAwADAALQAwADAAMAAwAC0AMAAwADAAMAAwADAAMAAwADAAMAAwADAAIgAsACIAbgBtACIA
OgAiAEcAZQBuAGUAcgBhAGwAIgAsACIAYQBjACIAOgAwACwAIgBvAHAAIgA6ADEALAAiAGMAdAAi
ADoAIgAyADAAMgAzAC0AMAA3AC0AMQAwAFQAMQAzADoAMgA1ADoAMAA4AFoAIgAsACIAbQB0ACIA
OgAiADAAMAAwADEALQAwADEALQAwADEAVAAwADAAOgAwADAAOgAwADAAIgAsACIAdQBjACIAOgBu
AHUAbABsAH0AXQAAAB8AAICGAwIAAAAAAMAAAAAAAABGAQAAAC4AAAB4AC0AbQBzAC0AcAB1AGIA
bABpAGMAdAByAGEAZgBmAGkAYwB0AHkAcABlAAAAAAABAAAADAAAAEUAbQBhAGkAbAAAAB8AAICG
AwIAAAAAAMAAAAAAAABGAQAAADYAAAB4AC0AbQBzAC0AdAByAGEAZgBmAGkAYwB0AHkAcABlAGQA
aQBhAGcAbgBvAHMAdABpAGMAAAAAAAEAAABIAAAAQgBMADMAUABSADEAMgBNAEIANgA0ADIANQA6
AEUARQBfAHwAQgBMADAAUABSADEAMgBNAEIANAA5ADQANwA6AEUARQBfAAAAHwAAgIYDAgAAAAAA
wAAAAAAAAEYBAAAAUAAAAHgALQBtAHMALQBvAGYAZgBpAGMAZQAzADYANQAtAGYAaQBsAHQAZQBy
AGkAbgBnAC0AYwBvAHIAcgBlAGwAYQB0AGkAbwBuAC0AaQBkAAAAAQAAAEoAAABjADAAOQA2ADAA
MAA4ADgALQBlADYAZQBhAC0ANABlADkANgAtADEAYQBkADcALQAwADgAZABiADgAMQA0ADkAYQA1
ADIAMAAAAAAAHwAAgIYDAgAAAAAAwAAAAAAAAEYBAAAAOAAAAHgALQBtAHMALQBlAHgAYwBoAGEA
bgBnAGUALQBzAGUAbgBkAGUAcgBhAGQAYwBoAGUAYwBrAAAAAQAAAAQAAAAxAAAAHwAAgIYDAgAA
AAAAwAAAAAAAAEYBAAAAOgAAAHgALQBtAHMALQBlAHgAYwBoAGEAbgBnAGUALQBhAG4AdABpAHMA
cABhAG0ALQByAGUAbABhAHkAAAAAAAEAAAAEAAAAMAAAAB8AAICGAwIAAAAAAMAAAAAAAABGAQAA
ACoAAAB4AC0AbQBpAGMAcgBvAHMAbwBmAHQALQBhAG4AdABpAHMAcABhAG0AAAAAAAEAAAAOAAAA
QgBDAEwAOgAwADsAAAAAAB8AAICGAwIAAAAAAMAAAAAAAABGAQAAAEQAAAB4AC0AbQBpAGMAcgBv
AHMAbwBmAHQALQBhAG4AdABpAHMAcABhAG0ALQBtAGUAcwBzAGEAZwBlAC0AaQBuAGYAbwAAAAEA
AAACBQAAZgBhAE4ARQBUAGYATAA5AEYAMwBXAEgAQQBLAHAAQgBMAFkAOABlAHoAQwB6ADEAYwBB
AC8AdABDAEEAagA3AFMAZwA0AE8AZQBXAEgAaQBxADUAUwBhAG4ATwAyAFYATwAvAGwAQQBaAE8A
VgBIADEAdwBPACsANgBaAC8AOQAxAGcAVABOAHYATwA2AFcAaQBZAFUAcwB2AEUAUABGAFEAMgAv
ADIAYwBSAFgALwBpAEQAbwBNAEIAdwBoAHYAUgBDAFgAYQB3AFEAZQA0AFcALwBEAGgAUQAxAEgA
dABxAFUASABpAFEAVwBrAEoAUgA3AGcAZABoAGwAWQAwAGQASwBqAFIAYgBaAHgAdwBuADcAawBB
ADQAawB3AGcAMgBoAFoAOABKAHcAaABjAFIAaQBQAFEAUQA0ADcAUwBCAGYAbABNAE4AOQAvAEgA
NwBHAFQAQQAxAEYAUQBSAHkAeQBsAC8AYwBZAGUAQwA1AEwAZwBaAGcAcQBwAFcAaABVAEwAaABm
AHAAdAB5AGcAVgBnADQAZwBDAHoAagBEAEYAVQBmAFcAaABSAGkAZQBmAHUAVgBHAFoASAAzAGgA
ZABDAHUAWABXADUAUgBoAEUAMwBhAG8AZwBsADIAVAArAEoAYwBUAEYAYwA5AEsAWgBUAGIATABh
AEsAZgBFAGsAYwBhAGcALwBOAHcAZAA1AHMAdQA2AHEAVQBUADIAOQB2AE8ASQBUAGgAcABJAHcA
UAAxAFgAOABCAEIAcwBlADMANQBUAHMAawB4AGwAcwBmACsAdgAwAGkAaAAwAFMAcwAyADAAVQBP
AG0AMQB0AE4AaQBpAEcAbgBqAHkAQgB6AGEAMwB1AFUAMAB2AGMAUABDAFgAQwB6AE4AcwBQADkA
SABoACsAdgBkAG0ARwBZAEwASwBBADAAcgBzAFQAVQBsAFYALwBpAHgATwA2AE8AQQB3AG0AawBI
AFcAcwB4AGIARABGAEMAUgA4AGUAdgBqAGgASgAwAEMASABVAGoAZwBCAGUATAAwAFgAbQB4AHgA
SABpAEcAZABmAHAANwBNAEEANQA3AFEAdAA0AEQAMABUAFoANAA4AG4AKwA0AHgAeAB3AHUAQwBZ
AEsAUABGAFUAaQB0ADEAQQA2AGMAMgB0AC8AcQBPAFgAZABQAHQARgB4AGoANwBLAEEASQBXAGsA
QwBSADkAUwBQADMAZgBCAHIATQBnAGYAdwBQAE4ARwB4ADkAZwArAEIATQAwADYAQwBzADUAKwAv
AHMAbgBTAG4AagBmAHQAVgBxAHMAMwBOAG4AOAA2AHkAUQB1ADQAYgBJAFUAdABUAGcAYgBZAHgA
TQBxAEwAOQBLAGkAQQBxAEEAQQB0AHUAMQBlADkAbAB3AHYAdwBsAGoATQBWAE0ANwBOADIAdgA2
ADUATwB1AEEAVABsAHEANQBEADMAVwBTAGwAdgBYADEAdgByAFEAWgBxAHYATQBuAHYANgBPAEcA
VQBEADAAMgBFAEUARQBYAFgAMQBVAHcANwBZAFcARwB3AGwAVAA0AC8AbwA1AGwAUQBIAGkAZwBZ
ACsAMwBSAFoAZQBUAGUAaAB3AEgATgBIAGYAQQBDAFYAOQA2AG8AUgBCAGkAMwBuAEwAMQBlAFoA
aABnADMANAA4AGEATwAzAGYAYQBsAEgAMABDAHAAUQAAAAAAHwAAgIYDAgAAAAAAwAAAAAAAAEYB
AAAAOAAAAHgALQBmAG8AcgBlAGYAcgBvAG4AdAAtAGEAbgB0AGkAcwBwAGEAbQAtAHIAZQBwAG8A
cgB0AAAAAQAAAH4EAABDAEkAUAA6ADIANQA1AC4AMgA1ADUALgAyADUANQAuADIANQA1ADsAQwBU
AFIAWQA6ADsATABBAE4ARwA6AGUAbgA7AFMAQwBMADoAMQA7AFMAUgBWADoAOwBJAFAAVgA6AE4A
TABJADsAUwBGAFYAOgBOAFMAUABNADsASAA6AEIATAAzAFAAUgAxADIATQBCADYANAAyADUALgBu
AGEAbQBwAHIAZAAxADIALgBwAHIAbwBkAC4AbwB1AHQAbABvAG8AawAuAGMAbwBtADsAUABUAFIA
OgA7AEMAQQBUADoATgBPAE4ARQA7AFMARgBTADoAKAAxADMAMgAzADAAMAAyADgAKQAoADQANgAz
ADYAMAAwADkAKQAoADMAOQA4ADYAMAA0ADAAMAAwADAAMgApACgAMwA3ADYAMAAwADIAKQAoADMA
OQA2ADAAMAAzACkAKAAxADMANgAwADAAMwApACgAMwA2ADYAMAAwADQAKQAoADMANAA2ADAAMAAy
ACkAKAA0ADUAMQAxADkAOQAwADIAMQApACgANwA2ADkANgAwADAANQApACgANAA3ADgANgAwADAA
MAAwADEAKQAoADcANgAxADEANgAwADAANgApACgAMQAxADAAMQAzADYAMAAwADUAKQAoADUANAA5
ADAANgAwADAAMwApACgANwAxADIAMAAwADQAMAAwADAAMAAxACkAKAA2ADYANQA3ADQAMAAxADUA
KQAoADgAMwAzADgAMAA0ADAAMAAwADAAMQApACgAMwAzADYANQA2ADAAMAAyACkAKAA4ADYAMwA2
ADIAMAAwADEAKQAoADMAOAAwADcAMAA3ADAAMAAwADAANQApACgANQA1ADAAMQA2ADAAMAAzACkA
KAAyADkAMAA2ADAAMAAyACkAKAA2ADYAOQA0ADYAMAAwADcAKQAoADEAOAA2ADAAMAAzACkAKAA1
ADMANQA0ADYAMAAxADEAKQAoADYANQAwADYAMAAwADcAKQAoADIANgAwADAANQApACgAOQA2ADgA
NgAwADAAMwApACgAOQA2ADYAMAAwADUAKQAoADMAOAAxADAAMAA3ADAAMAAwADAAMgApACgAMQAy
ADIAMAAwADAAMAAwADEAKQAoADkAMgAxADAAMAA1ACkAKAA4ADkAMwA2ADAAMAAyACkAKAA2ADYA
NAA0ADYAMAAwADgAKQAoADYANAA3ADUANgAwADAAOAApACgANgA2ADMANgAwADAAMgApACgANAAz
ADIANgAwADAAOAApACgANgA2ADQANwA2ADAAMAA3ACkAKAAzADEANgAwADAAMgApACgANgA2ADUA
NQA2ADAAMAA4ACkAKAA0ADEAMwAwADAANwAwADAAMAAwADEAKQAoADgANgA3ADYAMAAwADIAKQAo
ADUANgA2ADAAMwAwADAAMAAwADIAKQAoADUAMgA1ADMANgAwADEANAApADsARABJAFIAOgBPAFUA
VAA7AFMARgBQADoAMQAxADAAMQA7AAAAAAAfAACAhgMCAAAAAADAAAAAAAAARgEAAABcAAAAeAAt
AG0AcwAtAGUAeABjAGgAYQBuAGcAZQAtAGEAbgB0AGkAcwBwAGEAbQAtAG0AZQBzAHMAYQBnAGUA
ZABhAHQAYQAtAGMAaAB1AG4AawBjAG8AdQBuAHQAAAABAAAABAAAADEAAAAfAACAhgMCAAAAAADA
AAAAAAAARgEAAABKAAAAeAAtAG0AcwAtAGUAeABjAGgAYQBuAGcAZQAtAGEAbgB0AGkAcwBwAGEA
bQAtAG0AZQBzAHMAYQBnAGUAZABhAHQAYQAtADAAAAAAAAEAAABaDAAALwBzADQAWgBVAFAAYgBs
AEsAQwBvAHkAQwBzAFAATgBtADYAMABmAG4AZQBYAHQAYQAwAE8AYQBkAGkAeQBoAEwAYwBxAGgA
LwBWAHcANABxAGgARgBTAGwALwBuAGgARQBGAHoARQBpAGYAaABxAFoAVwBMAFMAMAA1ACsAKwBV
AHcAZwB5AEUAeQBnAEYATgBIAG4AMgBpAFYATwBYAG4AKwBNAEEAUwArAHgAZABlAGEATwBhAHIA
UwBRAE4AbwBFAFMAeQAzAE0AZAA1AE8ASwA1AGoARwBkACsAYQAvADEANQBSAG0AUgBpAFIAZgAy
AFUASwBmAFMAYgB4AE4AdABoAE0AVgBNAEsAeQB2AGEAaQBPAEwASAB0AEoALwAxADAAVgB0AGgA
VgA4ADYAUwBIAHQAagB1AGwAaAByAFoAVABBAHAAcgBDAHAAbwBVAEsAMQAzAGQAQwBuAEYANwBP
AFEAQgA0ADYAQgBEAEkAMwA1AG4AWQBJAHMAZwBaAEkAUABpADAARQAvAFAAdgBiAG4AWABoAEcA
eQB4AHIATgBxAGUANwAwADEAUQBBADUAMQB2AFIAKwBWADEATgAxAGcASwBxAEkARQBCAEMARwBR
AGIANQBXAGwAMwBMAE8AVQB2AHUAQgB1AGEATgBWAHgATwBDAFoAbQBWAHoASgAxAEEAYwBVAHIA
UQBEAGwAcQBpAEQAYwB4AFAAUwBXADMAcQB5ADcARwBZADUASQBpAEQAUgBvADkARABoAGkARwBh
AFUASwBIADMAcgBXAFIAWQB1AGcAaQBiAEQAVgAwAEsAMQBWAHAAVgBaAFIAUAA0AG4AaQBCAEIA
SQBEAE0AVABPADAAKwBJAGYAMgA0AGEAcQBFAEQATwAzADIASwBNAE8AbQBuADMAdgA0ADAAbABT
AEsASABlAGsAWQA1AGYAcABFAHQAUQAvAEQATQBLAEEAbQBpAE8ARgBwAGYAeABUAGkANgBtAHUA
WgBOAHgATAA4ADMATQBRAEQAYgBsAFAAeQBMAGgAMAArADgAMQBTAG0ASgBhADQAagB0AFAATgBW
AGQASQBPAEwAdQB3AEsAYQBSAGIAMQBIAGYAVQBSAEgAQgBYAEMAbABsAFIASgBWAHcAWABDAGIA
TQA3ADMAZwBZAHMANgByAHkANABWAFUANQBFAFcATwBJAEcARAA0AGcARgByAE8AaABnADgAcAAz
ADQAeQA0AE8AcAB1ACsANwBrAFIAbgA2AGgAOQBMAEUAVQBOAHIATAB3AGIAawB1AHYAYgBlAHEA
NwBrAEQAWgBFAFAAcgBwADYAWgBnAFkAcwBHADQAMgBCAHYAOABJAHAALwBIACsAYwBwAHgAagB6
ACsAYgBoAFkAawBYAGIANwBtAGgAdwA3AHMAOABPADUAbQAwAEEASwBJAGIANQBGAHEAcQBwAC8A
TgAyADUAVABsAHMANAArAGcANgAxADIASQA2AFgAZwBoAGwAcQBUADkAMwBsAEEAUABVAFgAeQA3
AGkAVQA0AGMALwBDAGIAYgBlAE8AaAB0AG0AYwBMAEwAOQB1AHcASwBtAE0ANgBEAHAAbQAzAHUA
YwA0AG0AcABoAFcAdgBXAGIARABsAEIAdwAwAHoAVQBhAHcAcwBkAGYAUwArAGQAVABnAFoAUgBE
ADMAUgBjAHMAUwBzADIAbwBaAGUALwBWAHAATwBnAEQAdgBYAGQAKwBoAGgAaABiAHgARwArAEkA
TgBVAGoAVQBiAGYAQwBnADEARgBoAHYAZABzADEAYwA2AEkARgBaAEUANQBoAFQARwBPAGEAZABX
AFEANQBOADUAKwBjAFQASQBJAHMASQAzAGsAbQA4AFoAOQBaADUATQBsAG8AdwBIAFUAQgA0ACsA
TgB6AEcAdABxAHYAKwB0AG4ATQBRAGYAOAB5AEUAYgBrAEoALwBoADQAYQBiAFkARwBQAFIAMQBR
ADkANgBMAFIASQAyAE0AUgA4AG4AWgBsADMAVQBWAHAAcAB4AEMASwB4AEgASgB3AEQAcwBxADcA
TwB6AC8AOAA1AGkAcQA2AHIAQwBHADUAdAA4ADIAQwBBAEUAUwBCAGoAegBtAEcAVAA5AEsAZQBZ
AFIAKwAxAE8AVwB1AEYARgBqAFoAQQBHADUAaQB1AFYANABZAGYAVQBWAGsAOQBHAHQAaQBNAG8A
RQBGAHIAagA0AHIAQQBDADkARABDAGMASABrAEIAOABVAHEAQwB2AE4AdQB0AFEANQBPAHIAMABI
AGoAaABjAEMATQBuAG0AOABJAFYAagB2AEUAawAvADcAQwBUAEgAbAB6AGQAcQBLAHQATQB4AHMA
NQBvAFoAcgBGADQAVgB1AGwAaAA3AHQAdgBrADkAVgBCAGEATgBLADkAMwBDADEASwAyAHMAVQBw
AEEAWgAwADgAUQBtAGsAYQBYAEsATgBYAGYAWQArAEUAMwBYAG8AbgBuAFIAUQAzADIAUwB1ADYA
UAArAGkAUgBLAC8AUgB1ADgAbwBIAE0AZABKAG8AYgBNADUAVABRAGYASgA4AFEAegBPADYAcgBD
AHgAawBCAFoAegBpAFMAagBtAEEATwB6AEIATQBMADcAOQBNAFEAeABzAEYAaQB3AEgAWABpAG4A
bwBzAEgAUAAxAEQAZQBzAFkATwA4AFkAZgArAEwAdQB0ADAAUwBZAGMAKwAyAEsAbgBuAEoAdQBu
ADMAZQBWAEkAegBEADQARwB4AFcASgBHAC8AbwBIAEwAagBsAGcAagAwAEwAMABEADYAYQBWADIA
cQBuAG8AKwB3ADEAMwBaAHQAMgB5AHgAQgBzAGEAMAA5AE8AbwBoAFMAQgBTAFQARgB2AGwAdQBx
AEYALwB4AFcATwBaAHgARgBTAHoAawBjAFYAUABOAEQATABaAHMAeQB2AEkAcwBWAEoAZQBzAGgA
bwAyAGMAdQBuAGgAawBEAHkAWABvAHoAcQBZADkARABkAHQAQgBGAHUAZgBQAEwAMQBGACsAdwA4
AHEAZgB4ADIANgBKAFkAQgA3AEMAMAA1AGkANQBtAFEAOAB3AE8AYQBTAFMATwBCAEwANABkAEgA
ZQBIAHUATwA4ADUAQwBQAGEAOABoAC8ASQB4AG4ATABEAEkAcgB5AGUAZQBkADcAOABzADAAdgBS
AEYAQQA4AFQAdwBXAFMATQBVAHcAcgBFAGYAegBFAEEATwBVAFQAMQBGAC8AbAA5AHYAdQB6AE4A
RgBrAGcANgBVAFkATABiAFUAcABBAHoAWAAyAFkAYwBDAFUAOQBjADIASABrAGEAMgA4AHEAUAAv
AHoAagBzAEQAWABpAGwASABDAHQAdQBKAEcAcgBEAFgAbwBoAEsAUABxAEsARQB0ACsAVwBWAHIA
cABnADUAYwB0AHkAeABJADEAVwBYAGgAQgBnAGkATABaAFgAOQA2AEQARgAxAEgAeABOADQATABw
AFIATABLAGYAQgBuAFQAVwB3AFoARAB0ADYAMQBjAE0ATwBFAHkAdQBmAGQARAAvAEIATABEAHIA
QQBSAEUANgBEAFUAZAAzAGkARQBMAEEAVwBZAEgAZwA1AFcAMAArAG0ANwBVAFQAbwArAEEAWQBi
AHYAWABRAHYAKwAxAFAATAAvAEEAOABCACsASgBHAG8AQQBGAGcAYwBOAHIAQQBmAGQARABrADAA
TABNACsAbQBjAEQAbgBSAGwAQQBEAEMAbABDAG4AMABtAHQAWgBMAHQANABjAGcAUQB2AEcAVQBl
AEgAQQBKAHMAbgBaAGIAbwA2AEcASgBZAGwATQByAHAAMABtAEQAeABXAHEAeAAyAEkAQgBVAFkA
VQBXAE8AawB5AFgAdgBjAHEAYQBCAE4AKwArAC8AaAA5ADkAdQB4AEcATQBkADkAWgBOAFcARwBz
AHAAcQBIAHMATwBIAGUAWABkAEcAaQBmAHMAagA2AGMAawBIAGEAZwB6AFoAaABEAHMAcABlADAA
SABFAG0AUAA0AEEAUgBWAGgASAAwAGEAVQBwAFYATwB2AEMAbQAwAHYAegBnAG0AVwBaAGEAYgAr
AHYAVwBHAFgAUABCAEIAWQBqAEsAMABNAEYAdwBVAEQAbgBFAFcARwB0AFgAbwB4AFgATwAvAEUA
ZAA2AEgAdwA9AAAAAACjMQ==

--_000_BL3PR12MB64255614B99289C3FE9D3100EE30ABL3PR12MB6425namp_--
