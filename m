Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBC87D4986
	for <lists+amd-gfx@lfdr.de>; Fri, 11 Oct 2019 22:54:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8085B6EC96;
	Fri, 11 Oct 2019 20:54:13 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam03on062c.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe48::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 737286EC93
 for <amd-gfx@lists.freedesktop.org>; Fri, 11 Oct 2019 20:54:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f1EpzKRCQPpV6HryojDS2qVuBSWFTq4QIbVzwjlIaBGCpJu1zkE4O81PwJfmVtvEzK1grTv9PnVDz+E2Nr2IyhYZfsV1M+mXT5qDtXoGtFcJBVWTlp1ixzrFsfoCg9t52dkASriPW1mz/I2Vxq65ege0FU4EdTnpBowLLNsosdMsnPJH5hM9U8TwmOQycxWdoWAdLsClhg8bEovPgZhYKK2R+I6El5RRE7JX3lMTwCHARSk0dUZB8x93ft4so/CSXzDKPSpPsPe0mqYKQApkNv8wXU8i5sFmeoJ4pRTO57paKjqUa5yGjQhuo8UdUhguspLs0Z9L1Nb7nrI7Ktm+OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=joFxYDZcpEwRXZ8MCIyxzvlSDIDy7HYk6WzFvRJ8xXA=;
 b=m3VI2nIS8bi4Y2sz7uH1jyY/iDMkJ5i6wvYAzmPghbOFmJuctIF5cdU0ofWcZX2I4Lfyq73IHtv8FOBgHLHxOT0sxWhwFX722//qFKcDYVgCQWcPNm9WHlsHnShk5EoH3QytwSO4yIONrrM23N0DO+42zcwsX57urDgv0X5i7CcYO1y5CN9rs3TVPoKrkgud2ssEO/hxyqNV4kvGId2xzmqf7e9Laa6FBGQIWsU2CKShDtdCgQyUuFCeqMpGgNdjh9VUtF4mfRPVm17w3262DKmdjnsEPED/5DWKm9WQpkM/BDfkRA8vt2JG4SlRQ5yWTDVYDVxWs7kq99ai5Lxrcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BN7PR12MB2593.namprd12.prod.outlook.com (20.176.27.87) by
 BN7PR12MB2610.namprd12.prod.outlook.com (20.176.26.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.16; Fri, 11 Oct 2019 20:54:09 +0000
Received: from BN7PR12MB2593.namprd12.prod.outlook.com
 ([fe80::dd2e:828d:7e1e:7c66]) by BN7PR12MB2593.namprd12.prod.outlook.com
 ([fe80::dd2e:828d:7e1e:7c66%7]) with mapi id 15.20.2347.021; Fri, 11 Oct 2019
 20:54:09 +0000
From: "Li, Sun peng (Leo)" <Sunpeng.Li@amd.com>
To: "Kazlauskas, Nicholas" <Nicholas.Kazlauskas@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amd/display: Free gamma after calculating legacy
 transfer function
Thread-Topic: [PATCH] drm/amd/display: Free gamma after calculating legacy
 transfer function
Thread-Index: AQHVgFCeHAGH4ELWNUWLy0A/epbGRqdV62qA
Date: Fri, 11 Oct 2019 20:54:09 +0000
Message-ID: <115d3c1e-60f0-e36a-8edc-624a3d539148@amd.com>
References: <20191011162610.1112-1-nicholas.kazlauskas@amd.com>
In-Reply-To: <20191011162610.1112-1-nicholas.kazlauskas@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTXPR0101CA0028.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::41) To BN7PR12MB2593.namprd12.prod.outlook.com
 (2603:10b6:408:25::23)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1f5039bd-5bf6-489e-667b-08d74e8d29e7
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: BN7PR12MB2610:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN7PR12MB2610F820000B574AA5BBB2A482970@BN7PR12MB2610.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-forefront-prvs: 0187F3EA14
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(366004)(396003)(136003)(39860400002)(376002)(199004)(189003)(81166006)(8936002)(81156014)(8676002)(186003)(486006)(76176011)(305945005)(26005)(2906002)(6116002)(3846002)(31696002)(52116002)(256004)(36756003)(102836004)(25786009)(6246003)(86362001)(4001150100001)(316002)(31686004)(446003)(4744005)(6436002)(476003)(71200400001)(53546011)(71190400001)(2501003)(7736002)(4326008)(6506007)(11346002)(386003)(99286004)(66556008)(66476007)(66446008)(66946007)(5660300002)(64756008)(6512007)(14454004)(6486002)(2616005)(229853002)(66066001)(478600001)(54906003)(110136005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN7PR12MB2610;
 H:BN7PR12MB2593.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: aDiYSleqFOhyemvzgW/Cf10SRGyE5opm5RvkkpXiLxb0SDVstsWcNtPx56bXaw9lrBUy779BaYNc+o3gYIaFnftn3wBXDzb15cp4iOsL087XGcf+7Q6McjMvHaO141PT6sqf2Utxt19ewJ8uHSfn5ong6cY8pqz90mAfYOt1t/OJj88kakYYhyFhO5AdVu2fdG+JXIMpOyL+pE13ycYP2+1AqjhHSLiaWZKgKXyk+n5x+4nzpJsXLOS5snNfr6GRXKwDonlhXv8NKxBtUFUAlRdNbeGfvP9Kh87z5ZexM8BT2cdQVjqmpoRduFBuELV/lS9ZoMMr+fvoV1VszeS5HX9BWObXNWExzw6aWtoSWoXF4MCxMTlTd2bzukqrkJYQC0oimucIPOSdfeISrBJNGbEoNjql4hegGEBKWVPGdD0=
Content-ID: <DCAFB3CECDF98C479DBD1D377D422A9A@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f5039bd-5bf6-489e-667b-08d74e8d29e7
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Oct 2019 20:54:09.8569 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: P3yRHzoWB4RTwYrNRz3bzi2QZ+6o8q9ECpgjMKKpJ+omXB72/SDyyRWufEsEJDBk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR12MB2610
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=joFxYDZcpEwRXZ8MCIyxzvlSDIDy7HYk6WzFvRJ8xXA=;
 b=jc31WDuqyD6ddF0j1kmwPiJ326bqyYzEnD3h0Ky9SLB0V4iuO5EeYiIzFuGPj6Ey3sz/X55YQNEHD3gy08KsEBdqoqNlkRkMzZOZ4LJyaq4ipMLfyzchfrhjkbZG7h7PjLw7V4fQ2mnX5BZ7p5lWo+6Fn55j3PR4xZIMvMOMrnQ=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Sunpeng.Li@amd.com; 
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Discussion list for AMD gfx <amd-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx@lists.freedesktop.org>
List-Help: <mailto:amd-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=subscribe>
Cc: "Lakha, Bhawanpreet" <Bhawanpreet.Lakha@amd.com>, "Yang,
 Philip" <Philip.Yang@amd.com>, "Wentland, Harry" <Harry.Wentland@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gMjAxOS0xMC0xMSAxMjoyNiBwLm0uLCBOaWNob2xhcyBLYXpsYXVza2FzIHdyb3RlOg0KPiBb
V2h5XQ0KPiBXZSdyZSBsZWFraW5nIG1lbW9yeSBieSBub3QgZnJlZWluZyB0aGUgZ2FtbWEgdXNl
ZCB0byBjYWxjdWxhdGUgdGhlDQo+IHRyYW5zZmVyIGZ1bmN0aW9uIGZvciBsZWdhY3kgZ2FtbWEu
DQo+IA0KPiBbSG93XQ0KPiBSZWxlYXNlIHRoZSBnYW1tYSBhZnRlciB3ZSdyZSBkb25lIHdpdGgg
aXQuDQo+IA0KPiBDYzogUGhpbGlwIFlhbmcgPFBoaWxpcC5ZYW5nQGFtZC5jb20+DQo+IENjOiBI
YXJyeSBXZW50bGFuZCA8aGFycnkud2VudGxhbmRAYW1kLmNvbT4NCj4gQ2M6IEJoYXdhbnByZWV0
IExha2hhIDxCaGF3YW5wcmVldC5MYWtoYUBhbWQuY29tPg0KPiBDYzogTGVvIExpIDxzdW5wZW5n
LmxpQGFtZC5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IE5pY2hvbGFzIEthemxhdXNrYXMgPG5pY2hv
bGFzLmthemxhdXNrYXNAYW1kLmNvbQ0KDQpSZXZpZXdlZC1ieTogTGVvIExpIDxzdW5wZW5nLmxp
QGFtZC5jb20+DQpUaGFua3MhDQoNCj4gLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3Bs
YXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9jb2xvci5jIHwgMiArKw0KPiAgMSBmaWxlIGNoYW5nZWQs
IDIgaW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
ZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtX2NvbG9yLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9jb2xvci5jDQo+IGluZGV4IGI0M2JiN2Y5MGU0
ZS4uMjIzM2QyOTNhNzA3IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3Bs
YXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9jb2xvci5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtX2NvbG9yLmMNCj4gQEAgLTIxMCw2ICsyMTAs
OCBAQCBzdGF0aWMgaW50IF9fc2V0X2xlZ2FjeV90ZihzdHJ1Y3QgZGNfdHJhbnNmZXJfZnVuYyAq
ZnVuYywNCj4gIAlyZXMgPSBtb2RfY29sb3JfY2FsY3VsYXRlX3JlZ2FtbWFfcGFyYW1zKGZ1bmMs
IGdhbW1hLCB0cnVlLCBoYXNfcm9tLA0KPiAgCQkJCQkJIE5VTEwpOw0KPiAgDQo+ICsJZGNfZ2Ft
bWFfcmVsZWFzZSgmZ2FtbWEpOw0KPiArDQo+ICAJcmV0dXJuIHJlcyA/IDAgOiAtRU5PTUVNOw0K
PiAgfQ0KPiAgDQo+IA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
