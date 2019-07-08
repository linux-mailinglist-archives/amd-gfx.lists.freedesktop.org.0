Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D4D6625C3
	for <lists+amd-gfx@lfdr.de>; Mon,  8 Jul 2019 18:07:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF0DE89F24;
	Mon,  8 Jul 2019 16:07:44 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710050.outbound.protection.outlook.com [40.107.71.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFBE589F24
 for <amd-gfx@lists.freedesktop.org>; Mon,  8 Jul 2019 16:07:43 +0000 (UTC)
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) by
 DM6PR12MB2667.namprd12.prod.outlook.com (20.176.116.28) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.19; Mon, 8 Jul 2019 16:07:42 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::91a2:f9e7:8c86:f927]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::91a2:f9e7:8c86:f927%7]) with mapi id 15.20.2052.020; Mon, 8 Jul 2019
 16:07:42 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amdgpu: Fix build errors with HMM disabled
Thread-Topic: [PATCH] drm/amdgpu: Fix build errors with HMM disabled
Thread-Index: AQHVNabpXc6Q8HLNK0uCrDVISjzZ/abA4zoA
Date: Mon, 8 Jul 2019 16:07:42 +0000
Message-ID: <91eb6cd7-50ba-2726-7391-d87da03ae221@amd.com>
References: <20190708160441.1087-1-Felix.Kuehling@amd.com>
In-Reply-To: <20190708160441.1087-1-Felix.Kuehling@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
x-clientproxiedby: YTBPR01CA0028.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::41) To DM6PR12MB3947.namprd12.prod.outlook.com
 (2603:10b6:5:1cb::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7ddad756-46aa-4782-6f3c-08d703be6835
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB2667; 
x-ms-traffictypediagnostic: DM6PR12MB2667:
x-microsoft-antispam-prvs: <DM6PR12MB2667C95F873833EEE741EDEF92F60@DM6PR12MB2667.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3826;
x-forefront-prvs: 00922518D8
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(346002)(376002)(39860400002)(136003)(396003)(199004)(189003)(66476007)(66446008)(66946007)(6116002)(73956011)(66556008)(64756008)(186003)(256004)(65826007)(58126008)(26005)(65806001)(53936002)(8936002)(68736007)(14444005)(71200400001)(386003)(66066001)(6506007)(3846002)(316002)(2906002)(65956001)(476003)(71190400001)(2501003)(5660300002)(102836004)(86362001)(31696002)(76176011)(52116002)(64126003)(53546011)(6916009)(8676002)(14454004)(229853002)(6486002)(99286004)(4326008)(486006)(305945005)(446003)(6436002)(2351001)(11346002)(7736002)(478600001)(6246003)(31686004)(5640700003)(81166006)(72206003)(81156014)(6512007)(2616005)(36756003)(25786009);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB2667;
 H:DM6PR12MB3947.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: HSJqvXEI1Cv/ldPX2cCzWB1/4wNG4fz/S02KvHehtA0+BuzrUnDQcKmjTEH6H75eMequJ2NkkvioX5gSvBLbB7FkpZmFgSOxMOQqYQhn5OFDI5YHYU1nIFOjnyiZhkz3Rgl2dZ82p7J5mGGjK2W+mp05Mq+ehwuR/MkNWcenrw786RE8Qz7wW3C29ILVRkjLaf4TL7V2P+qavr/M8B+5Tgwn1f1rF5sPiAMvrzlmnfdP/vsxXhUYxgKh8zmvFsmq8/7vHV0E68kXZLMJwT2TwivBiJyZTspTQ5AlEMn3r+b4iSYH7vN1nK/ByS4cmUUzJasZo8VrNpYyiESylLRGEjk+c6SKdwvjEMooj206CWMxHJ3HzkjGXEItmeqaSs+b+TIGCU3JYXVqcSyVmDcSb5l/Owb5y6AS45K2CRKdnDM=
Content-ID: <A5DA4E75C0180846A1406CA123E530F3@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ddad756-46aa-4782-6f3c-08d703be6835
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jul 2019 16:07:42.5025 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fkuehlin@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2667
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d3gWCUxAcbZ5LVDNgJFG5J5gnAqoXm2qw+7DGNQHnmE=;
 b=gMKGQfqshQYfjy0T1h7z5V76xYGBYGFIIfVk5rU0CYtL66LmOQLupwkLo9O1VnEr+kT/sFP5DxDU+N31IgD2iFUthw9Y/T61XI8UDiGmDc9ZlXGkf8zTVxvdcNoEPYGJQiXs9UwcpUGxIBylCa0MtTxetvii8+SeJ3Dc2a/MJWo=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Felix.Kuehling@amd.com; 
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
Cc: "StDenis, Tom" <Tom.StDenis@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

TG9va3MgbGlrZSBBcm5kIEJlcmdtYW5uIGFscmVhZHkgZml4ZWQgaXQgd2l0aCBhIGRpZmZlcmVu
dCBwYXRjaC4gVGhhdCdzIA0KZmluZSB3aXRoIG1lIHRvby4gRmVlbCBmcmVlIHRvIGlnbm9yZSB0
aGlzLg0KDQpPbiAyMDE5LTA3LTA4IDEyOjA1IHAubS4sIEt1ZWhsaW5nLCBGZWxpeCB3cm90ZToN
Cj4gT25seSBkZWZpbmUgc3RydWN0IGFtZGdwdV9tbiBpZiBITU1fTUlSUk9SIGlzIGVuYWJsZWQu
IEFkZCBiYWNrIGENCj4gZm9yd2FyZCBkZWNsYXJhdGlvbiBmb3IgdGhlIGNhc2UgdGhhdCBpdCBp
c24ndC4NCj4NCj4gRml4ZXM6IDZmMWMzZTYxZDJkOCAoImRybS9hbWRncHU6IFByZXBhcmUgZm9y
IGhtbV9yYW5nZV9yZWdpc3RlciBBUEkgY2hhbmdlIikNCj4gU2lnbmVkLW9mZi1ieTogRmVsaXgg
S3VlaGxpbmcgPEZlbGl4Lkt1ZWhsaW5nQGFtZC5jb20+DQo+IC0tLQ0KPiAgIGRyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9tbi5oIHwgNiArKysrKy0NCj4gICAxIGZpbGUgY2hhbmdl
ZCwgNSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+DQo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfbW4uaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV9tbi5oDQo+IGluZGV4IDI4MWZkOWZlZjY2Mi4uMzNjYTYyMTRkYjkwIDEw
MDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfbW4uaA0KPiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfbW4uaA0KPiBAQCAtMzUsNiAr
MzUsOCBAQCBlbnVtIGFtZGdwdV9tbl90eXBlIHsNCj4gICAJQU1ER1BVX01OX1RZUEVfSFNBLA0K
PiAgIH07DQo+ICAgDQo+ICsjaWYgZGVmaW5lZChDT05GSUdfSE1NX01JUlJPUikNCj4gKw0KPiAg
IC8qKg0KPiAgICAqIHN0cnVjdCBhbWRncHVfbW4NCj4gICAgKg0KPiBAQCAtNjksNyArNzEsNiBA
QCBzdHJ1Y3QgYW1kZ3B1X21uIHsNCj4gICAJc3RydWN0IGhtbV9taXJyb3IJbWlycm9yOw0KPiAg
IH07DQo+ICAgDQo+IC0jaWYgZGVmaW5lZChDT05GSUdfSE1NX01JUlJPUikNCj4gICB2b2lkIGFt
ZGdwdV9tbl9sb2NrKHN0cnVjdCBhbWRncHVfbW4gKm1uKTsNCj4gICB2b2lkIGFtZGdwdV9tbl91
bmxvY2soc3RydWN0IGFtZGdwdV9tbiAqbW4pOw0KPiAgIHN0cnVjdCBhbWRncHVfbW4gKmFtZGdw
dV9tbl9nZXQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsDQo+IEBAIC03OCw2ICs3OSw5IEBA
IGludCBhbWRncHVfbW5fcmVnaXN0ZXIoc3RydWN0IGFtZGdwdV9ibyAqYm8sIHVuc2lnbmVkIGxv
bmcgYWRkcik7DQo+ICAgdm9pZCBhbWRncHVfbW5fdW5yZWdpc3RlcihzdHJ1Y3QgYW1kZ3B1X2Jv
ICpibyk7DQo+ICAgdm9pZCBhbWRncHVfaG1tX2luaXRfcmFuZ2Uoc3RydWN0IGhtbV9yYW5nZSAq
cmFuZ2UpOw0KPiAgICNlbHNlDQo+ICsNCj4gK3N0cnVjdCBhbWRncHVfbW47DQo+ICsNCj4gICBz
dGF0aWMgaW5saW5lIHZvaWQgYW1kZ3B1X21uX2xvY2soc3RydWN0IGFtZGdwdV9tbiAqbW4pIHt9
DQo+ICAgc3RhdGljIGlubGluZSB2b2lkIGFtZGdwdV9tbl91bmxvY2soc3RydWN0IGFtZGdwdV9t
biAqbW4pIHt9DQo+ICAgc3RhdGljIGlubGluZSBzdHJ1Y3QgYW1kZ3B1X21uICphbWRncHVfbW5f
Z2V0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LA0KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9hbWQtZ2Z4
