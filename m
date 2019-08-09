Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0772887051
	for <lists+amd-gfx@lfdr.de>; Fri,  9 Aug 2019 05:51:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A03F6ECF6;
	Fri,  9 Aug 2019 03:51:04 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680047.outbound.protection.outlook.com [40.107.68.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C93656ECF6
 for <amd-gfx@lists.freedesktop.org>; Fri,  9 Aug 2019 03:51:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NFLajQ6tzjoltKBV2c7Ck/d+RgPAGxKCrIAJtKFULXL7/0pKggAMcQFU09NvSZMlPYIUEZcNdklJz1cGroh545X7cyIfxIuku9B5eDoK2zodqDhaK6wRCNk2Q+F4C1GngxaoWaxaX8lOaAE0Q//Q1zhMkBLKiP9HqZmJ0APDJujMmQZYUZrCWT4u6XXtZbEJQTDEeoFPIqCemSrDQ/vdzrK1O8j/mDjFA9qLSWJSaoJTRIUEFmwTbDNav/KlwDubjSXoggU1UPxoXyw8TKUWh7DriJE8wTiJdmNYgR+v5HRCRC/jNgoQ35+bCH2HM+44fm37nQzIvWA7XexhJnP+gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kDPoPVzrMQQNRznbd8lQTvsr/3ND/mSQtVOsF0Tl7g8=;
 b=lX0WPLxiJVkf6o6sUjnCgEhG4CqjV/PX9hICIQWDFFHz61mZQPhHiInkENT5yM+Z7JN5l2RxSiV2dvBeEbeSvNPgKTnmc2Hvtd79I1o/Dksd93mF80F3dQU1VSf7R/LE8wgUOIRF9kF09hpKdWq5GrdnhuoxMOVL++DUCnMQo9UjgqAQbgR1yNfSOtx7zZPv9gPwhpx5KE/6gyBw5DJykCszbr9GTyyutRZX02FwyCmZotDwiWjfNZQIURJWng8TD4El5X0EmEZQrSTswd5YhELaQKZZKi8puVaTkPp5gqn54RimQXjn48ShNcPHsK5oZqhk8yuuY/CXsYKPsPS5YA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3598.namprd12.prod.outlook.com (20.178.244.84) by
 MN2PR12MB3981.namprd12.prod.outlook.com (10.255.238.222) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.14; Fri, 9 Aug 2019 03:51:01 +0000
Received: from MN2PR12MB3598.namprd12.prod.outlook.com
 ([fe80::a556:ef17:e8e:2037]) by MN2PR12MB3598.namprd12.prod.outlook.com
 ([fe80::a556:ef17:e8e:2037%7]) with mapi id 15.20.2157.015; Fri, 9 Aug 2019
 03:51:01 +0000
From: "Feng, Kenneth" <Kenneth.Feng@amd.com>
To: "Ma, Le" <Le.Ma@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH 6/9] drm/amdgpu: add sdma clock gating for Arcturus
Thread-Topic: [PATCH 6/9] drm/amdgpu: add sdma clock gating for Arcturus
Thread-Index: AQHVTdMne0GhJDWT3Uq+asL14Rg5ZKbyL5yg
Date: Fri, 9 Aug 2019 03:51:00 +0000
Message-ID: <MN2PR12MB35988C2B331A65724906AFA58ED60@MN2PR12MB3598.namprd12.prod.outlook.com>
References: <1565259714-30357-1-git-send-email-le.ma@amd.com>
 <1565259714-30357-6-git-send-email-le.ma@amd.com>
In-Reply-To: <1565259714-30357-6-git-send-email-le.ma@amd.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a93b8ed0-0b7f-4fc5-0aa3-08d71c7ccba1
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3981; 
x-ms-traffictypediagnostic: MN2PR12MB3981:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB398165F9FFD1B7493CEF44738ED60@MN2PR12MB3981.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1079;
x-forefront-prvs: 01244308DF
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(346002)(376002)(396003)(366004)(136003)(199004)(189003)(13464003)(2501003)(66556008)(64756008)(305945005)(76116006)(6436002)(14454004)(99286004)(446003)(476003)(7736002)(102836004)(26005)(81156014)(33656002)(66476007)(66946007)(14444005)(256004)(81166006)(5660300002)(316002)(86362001)(110136005)(6116002)(3846002)(229853002)(2906002)(71190400001)(71200400001)(66066001)(74316002)(25786009)(55016002)(7696005)(486006)(6306002)(53546011)(9686003)(4326008)(8936002)(11346002)(6246003)(186003)(8676002)(6506007)(478600001)(66446008)(52536014)(76176011)(966005)(53936002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3981;
 H:MN2PR12MB3598.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: K7KOPIhEUhUONDpBl/+HFymbWb4VPh0VgT3eNuKyAVuG4Yju4VJ6iuGCzsNbOE4Z/ulZioig0CiaY7kTRAKyodYcnnGw4yLv9XwMWuNjX3XZ0xb+Kuv/n58I/TpjbKC9tqxbO38G7UvHaJ+2TAt1XhRw20LKjP39J4C2lzjEvbzIv4LmhKO2GkRZPipganwKjzA2ETPVkI78kz8LlPutUHF3mtv0Y/214AT5LYqnn2zsTAoUO9JzA9vHSNTu0fF2CJw/syBmtuYro0rL15MNLZansDWS33kUEnhzi5GSGWWxGsPY3vOUFxcX2jd3UqTW7MobCb85MW43lCfU7+++1F8QC0zrsJbU+m/JKLf5PXU1t3lPq/SlfzXwY/gYlEUEExIZ0VRcUYCIXXdJu68jnrbJ8al3qcGCAtJ/DwXuOHM=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a93b8ed0-0b7f-4fc5-0aa3-08d71c7ccba1
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Aug 2019 03:51:00.9228 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XaxUbjWM91/nYyghbTDn8l+O3MP65Nd60/7b+72aa1WXZINHQ3h4mNTR22huKXrR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3981
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kDPoPVzrMQQNRznbd8lQTvsr/3ND/mSQtVOsF0Tl7g8=;
 b=EBh42sCSgV8Z37X0oY0LhnW0p4NVUs8utTmlfP0pybVMh8IYptxggdufnh2W4X8cwejtulpkmcuem+P+LemRv46rHrS3D2xDOjhuxdXq6qRid9U7FY32diB+8xarZJLb0hDreZiU71v0XNhCo5KQkcGsXL8xkRWUpVF8D4dC90Y=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Kenneth.Feng@amd.com; 
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
Cc: "Ma, Le" <Le.Ma@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IEtlbm5ldGggRmVuZyA8a2VubmV0aC5mZW5nQGFtZC5jb20+DQoNCg0KLS0t
LS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IGFtZC1nZnggW21haWx0bzphbWQtZ2Z4LWJv
dW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnXSBPbiBCZWhhbGYgT2YgTGUgTWENClNlbnQ6IFRo
dXJzZGF5LCBBdWd1c3QgMDgsIDIwMTkgNjoyMiBQTQ0KVG86IGFtZC1nZnhAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnDQpDYzogTWEsIExlIDxMZS5NYUBhbWQuY29tPg0KU3ViamVjdDogW1BBVENIIDYv
OV0gZHJtL2FtZGdwdTogYWRkIHNkbWEgY2xvY2sgZ2F0aW5nIGZvciBBcmN0dXJ1cw0KDQpbQ0FV
VElPTjogRXh0ZXJuYWwgRW1haWxdDQoNCkFkZCBBUkNUVVJVUyBjYXNlIGluIHNkbWEgc2V0IGNs
b2NrZ2F0aW5nIGZ1bmN0aW9uDQoNCkNoYW5nZS1JZDogSTY1YTNkOTlhMTQwYThhNzY5NDliNGQw
M2MyMGJjNmUwMTk1Yzk4NTQNClNpZ25lZC1vZmYtYnk6IExlIE1hIDxsZS5tYUBhbWQuY29tPg0K
LS0tDQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc2RtYV92NF8wLmMgfCAxICsNCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykNCg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L3NkbWFfdjRfMC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc2Rt
YV92NF8wLmMNCmluZGV4IDllM2M2M2MuLjE4NWRmZjAgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9zZG1hX3Y0XzAuYw0KKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvc2RtYV92NF8wLmMNCkBAIC0yMTU3LDYgKzIxNTcsNyBAQCBzdGF0aWMgaW50IHNkbWFf
djRfMF9zZXRfY2xvY2tnYXRpbmdfc3RhdGUodm9pZCAqaGFuZGxlLA0KICAgICAgICBjYXNlIENI
SVBfVkVHQTEyOg0KICAgICAgICBjYXNlIENISVBfVkVHQTIwOg0KICAgICAgICBjYXNlIENISVBf
UkFWRU46DQorICAgICAgIGNhc2UgQ0hJUF9BUkNUVVJVUzoNCiAgICAgICAgICAgICAgICBzZG1h
X3Y0XzBfdXBkYXRlX21lZGl1bV9ncmFpbl9jbG9ja19nYXRpbmcoYWRldiwNCiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgc3RhdGUgPT0gQU1EX0NHX1NUQVRFX0dBVEUgPyB0cnVlIDog
ZmFsc2UpOw0KICAgICAgICAgICAgICAgIHNkbWFfdjRfMF91cGRhdGVfbWVkaXVtX2dyYWluX2xp
Z2h0X3NsZWVwKGFkZXYsDQotLQ0KMi43LjQNCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18NCmFtZC1nZnggbWFpbGluZyBsaXN0DQphbWQtZ2Z4QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZw0KaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9hbWQtZ2Z4DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
