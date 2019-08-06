Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A86E082F04
	for <lists+amd-gfx@lfdr.de>; Tue,  6 Aug 2019 11:48:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 035A76E34A;
	Tue,  6 Aug 2019 09:48:35 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780078.outbound.protection.outlook.com [40.107.78.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACE416E34A
 for <amd-gfx@lists.freedesktop.org>; Tue,  6 Aug 2019 09:48:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UlzS72oh2ePo8S9fNliLq4NGBVp65n9cTsAjro/3SFj28wYIS+BmMmxF7c2nk/rkcacYWu3Nshk68UPq0KJMf/S7Jb7pfLElveHNBZYfHZvli7ouoVEFWtqEsNwhWvEtLki36SlD20TN3rCo7LONiD2rd4TE+sMG11X+MKX3Kw9VxOVP/hKC2qg0qOiDNDgcRXZycc1+1zZdDuP2XeP6WrISj/E0+dR3mFrViLT5V+XxD7L0BEEkqLg9Yy06NBUJORxgMg0wXTBvV7NinOmdp6wTbOyPX7x3V+aiwccFcZ0rYKLabMVEPGOgcxPNR3u9uits/NR2YOQa74EXdqyl0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9sFDexWt//RmRJJAxJz+ZYuV1eKoEBKiS9ZQa69wHNo=;
 b=oAjOhOWaUfATOag+uLmiOwqgHRRJ850OaI1tINg1FcL4jNvukKcUuRjPyOj6uz4CDo+3DW1jle1n57fA7/tzNvesVtAJhvX6kYs/RW5OmHxEcSoeftsafUE8Aj/XBASouIq7sEqkR0FpgIXjqWNgEwDtJF86fp5KfSZXMbQa8250XzBPRCXiievSR146yoIwKCVMnTyX+zOMvVOMe6wwlbABvDtyT37AEPjQZxOw0dZJV0iiPomlrLWEA9ErCK1oQYCPm+atn6AyaFEDOIv6uBSxzKy+CBZa0QO+uJ5WJ09cDk6VVQXXlkf+mTyzmKslypK22t3EEd0YEwHfp5ygoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from MN2PR12MB3054.namprd12.prod.outlook.com (20.178.244.79) by
 MN2PR12MB3277.namprd12.prod.outlook.com (20.179.82.220) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.14; Tue, 6 Aug 2019 09:48:31 +0000
Received: from MN2PR12MB3054.namprd12.prod.outlook.com
 ([fe80::90f0:834e:73ee:76c7]) by MN2PR12MB3054.namprd12.prod.outlook.com
 ([fe80::90f0:834e:73ee:76c7%5]) with mapi id 15.20.2136.018; Tue, 6 Aug 2019
 09:48:31 +0000
From: "Zhou1, Tao" <Tao.Zhou1@amd.com>
To: "Chen, Guchun" <Guchun.Chen@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "Zhang, Hawking" <Hawking.Zhang@amd.com>,
 "Li, Dennis" <Dennis.Li@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>
Subject: RE: [PATCH libdrm 0/3] add ras eject test for gfx and umc module
Thread-Topic: [PATCH libdrm 0/3] add ras eject test for gfx and umc module
Thread-Index: AQHVTCnIsEAbcPT4r0GoFdAcdQqBeqbt313w
Date: Tue, 6 Aug 2019 09:48:31 +0000
Message-ID: <MN2PR12MB305451D1D8E5326F9679030FB0D50@MN2PR12MB3054.namprd12.prod.outlook.com>
References: <20190806073629.10976-1-guchun.chen@amd.com>
In-Reply-To: <20190806073629.10976-1-guchun.chen@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b1e267db-a2ac-4cd0-d4af-08d71a533d9c
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3277; 
x-ms-traffictypediagnostic: MN2PR12MB3277:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <MN2PR12MB32772E693BA4E392FCAB63FAB0D50@MN2PR12MB3277.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:311;
x-forefront-prvs: 0121F24F22
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(979002)(4636009)(346002)(39860400002)(366004)(136003)(376002)(396003)(199004)(189003)(13464003)(71200400001)(9686003)(68736007)(53936002)(6306002)(6636002)(446003)(11346002)(6436002)(99286004)(186003)(486006)(4326008)(55016002)(25786009)(476003)(110136005)(316002)(5660300002)(52536014)(7696005)(102836004)(478600001)(71190400001)(256004)(66066001)(6246003)(26005)(74316002)(76176011)(66446008)(966005)(2906002)(229853002)(6116002)(64756008)(8936002)(66946007)(66476007)(33656002)(76116006)(2501003)(66556008)(86362001)(3846002)(7736002)(14454004)(53546011)(6506007)(8676002)(81156014)(81166006)(305945005)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3277;
 H:MN2PR12MB3054.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: /06KSjPsmDfRjpZst5efrMoPcQ7xXE+JBKUg98rdhJnDZBmhq3i2xqt96vtHW/GAbyMLnODbVQWkEcfJXeBw+A6TYBZXq/dpRgD6NCzIWYR5y50ch7r28zdABy7uTW2AwZJcGx/2dGeSO0xWryIW224pd/0ySVpJPiVhtzhP6rNXlnoKAYobDl7SGYvMGWRMzv0MhMI49OozNEyfSzNsJO6KlHYTMWNvhe5LiWyFg0VQg2qiBATDIsy0D029zCUVwQr0SSUk0c7JiRJhw9N0kMcarbTqxiuc/x28O1w2pHBCteBcAgNDH9nxKXgQ/CGppjMEolbTXnEfIBCSkA/7kpf9yNd9Y7e5sNa1bdppouIXQYSj4y9tP+BXsqPmi8mCgpBjxkVhvklGSHfzZ0Bm6UP1Jy6mf/M0EptxlbC6dfM=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1e267db-a2ac-4cd0-d4af-08d71a533d9c
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Aug 2019 09:48:31.2981 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tazhou1@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3277
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9sFDexWt//RmRJJAxJz+ZYuV1eKoEBKiS9ZQa69wHNo=;
 b=nJY5IhUI48+etPsQJ0+bBO2xnSQbtTvYBMCgoPmWUva3Xkh/1XlFk2uaO25sSOqV0Ygqk8PEnqjOV6Zoo/OzrmPvy/kp6AkQQNh+vDTQ7ezheZdDK3wBJ+ELhmc5pzjL3SuRNP4ddZ3GexUuNTse1NnmRir0AwYb0hnUyMNAfuE=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Tao.Zhou1@amd.com; 
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
Cc: "Chen, Guchun" <Guchun.Chen@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UGxlYXNlIGNoYW5nZSBhbGwgImVqZWN0IiB0byAiaW5qZWN0IiBpbiBjb21taXQgc3ViamVjdCBh
bmQgZGVzY3JpcHRpb24uDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBhbWQt
Z2Z4IDxhbWQtZ2Z4LWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2Yg
R3VjaHVuIENoZW4NClNlbnQ6IDIwMTnlubQ45pyINuaXpSAxNTozNg0KVG86IGFtZC1nZnhAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnOyBaaGFuZywgSGF3a2luZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29t
PjsgTGksIERlbm5pcyA8RGVubmlzLkxpQGFtZC5jb20+OyBQYW4sIFhpbmh1aSA8WGluaHVpLlBh
bkBhbWQuY29tPjsgWmhvdTEsIFRhbyA8VGFvLlpob3UxQGFtZC5jb20+DQpDYzogQ2hlbiwgR3Vj
aHVuIDxHdWNodW4uQ2hlbkBhbWQuY29tPg0KU3ViamVjdDogW1BBVENIIGxpYmRybSAwLzNdIGFk
ZCByYXMgZWplY3QgdGVzdCBmb3IgZ2Z4IGFuZCB1bWMgbW9kdWxlDQoNClRoZXNlIHBhdGNoZXMg
YXJlIHRvIHN1cHBvcnQgcmFzIGVqZWN0IHRlc3QgZm9yIGdmeCBhbmQgdW1jIG1vZHVsZXMuDQoN
Ckd1Y2h1biBDaGVuICgzKToNCiAgYW1kZ3B1OiBhZGQgZ2Z4IHJhcyBlamVjdCBjb25maWd1cmF0
aW9uIGZpbGUNCiAgdGVzdHMvYW1kZ3B1L3JhczogcmVmaW5lIHJhcyBlamVjdCB0ZXN0DQogIGFt
ZGdwdTogYWRkIHVtYyByYXMgZWplY3QgdGVzdCBjb25maWd1cmF0aW9uDQoNCiBjb25maWd1cmUu
YWMgICAgICAgICAgICAgfCAgMTggKysNCiBkYXRhL2FtZGdwdV9yYXMuanNvbiAgICAgfCAyNjAg
KysrKysrKysrKysrKysrKysrKysNCiBtZXNvbi5idWlsZCAgICAgICAgICAgICAgfCAgIDEgKw0K
IHRlc3RzL2FtZGdwdS9NYWtlZmlsZS5hbSB8ICAgNSArLQ0KIHRlc3RzL2FtZGdwdS9tZXNvbi5i
dWlsZCB8ICAxNiArLQ0KIHRlc3RzL2FtZGdwdS9yYXNfdGVzdHMuYyB8IDUyMCArKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0NCiA2IGZpbGVzIGNoYW5nZWQsIDc2OSBpbnNl
cnRpb25zKCspLCA1MSBkZWxldGlvbnMoLSkgIGNyZWF0ZSBtb2RlIDEwMDY0NCBkYXRhL2FtZGdw
dV9yYXMuanNvbg0KDQotLQ0KMi4xNy4xDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fDQphbWQtZ2Z4IG1haWxpbmcgbGlzdA0KYW1kLWdmeEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcNCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vYW1kLWdmeA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
