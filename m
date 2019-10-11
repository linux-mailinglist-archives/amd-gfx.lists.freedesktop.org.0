Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CB29D3836
	for <lists+amd-gfx@lfdr.de>; Fri, 11 Oct 2019 06:07:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5497B6E3F4;
	Fri, 11 Oct 2019 04:07:29 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690076.outbound.protection.outlook.com [40.107.69.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 441326E3F4
 for <amd-gfx@lists.freedesktop.org>; Fri, 11 Oct 2019 04:07:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ioW6fscSsDbmkEgwEzKkpnAAx4+AFqCQp+FTb3lOr2pZiWju9s9gCY79Jel+Tb+u0ZQ2fhuVVGW1oYnjHwOzOgbgEJd7B+l0RF4Tl4GidiDzKh3ilOM+5ARNrWA29TW/jR5tj2I+I71RalOpib9pL4X71QTKG6mSF1e+gfEaekndW0XDwsCKAUpGWykKgyTHCfv01hmg4DYYkRHYSFoVaY80Cyv26qRvIBL0eXn0yWvdaEb8jxUMMru1Zv7cicp9Ys5EYupQ6tZ1hPRnW1kal6duArqdhA03qyOawAsc+HIZ0cQRsjOtlyH9dqXpeWHrp/loFjIX/DwRWIMrw5vR5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u/rLZ7taLR2MHJGzOrPROG7vpBhoYD2abvgJ58poIAk=;
 b=UwVtdhAOYH3Rg+ytR7m1qq3Ihahbb3mOv2WH2+AeLlXfm4GwZmGvL+UoEJ6lceFN1/QLO2YqvwHYJgvWE+VKyop6gHkaBsC7PPoL3Qf4O6LcuWXOCDD+eXs9BcTYOT0c1oh7ik+dG9jaECqB/WqTkLvEkbRDq2mpumi6CVhUmiiFBe4MkvxTjQwTbX1TWa5D1Sa18bDElYX5k1E9LgAu/x0WTxnfvVRKshdfTHZwqE6LonVduFIJHNurYXKtattSWtjMawd5WgnxJ8rBfytEk6/Q6FL/i9j5Jr7r2uuNGvoj7ApTxThn3Abl3wvCe4O8fY2MILnCL3I/1Vp2PhgP/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BN8PR12MB3329.namprd12.prod.outlook.com (20.178.208.93) by
 BN8PR12MB3459.namprd12.prod.outlook.com (20.178.209.75) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.16; Fri, 11 Oct 2019 04:07:27 +0000
Received: from BN8PR12MB3329.namprd12.prod.outlook.com
 ([fe80::28c4:55fd:ee27:8560]) by BN8PR12MB3329.namprd12.prod.outlook.com
 ([fe80::28c4:55fd:ee27:8560%7]) with mapi id 15.20.2347.016; Fri, 11 Oct 2019
 04:07:26 +0000
From: "Quan, Evan" <Evan.Quan@amd.com>
To: Alex Deucher <alexdeucher@gmail.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH 2/5] drm/amdgpu: move gpu reset out of
 amdgpu_device_suspend
Thread-Topic: [PATCH 2/5] drm/amdgpu: move gpu reset out of
 amdgpu_device_suspend
Thread-Index: AQHVf38fpZTVkQVYz0m5HpaUx8AeoadU02TA
Date: Fri, 11 Oct 2019 04:07:26 +0000
Message-ID: <BN8PR12MB3329E4B5DE6B027D43B38F5AE4970@BN8PR12MB3329.namprd12.prod.outlook.com>
References: <20191010152619.31011-1-alexander.deucher@amd.com>
 <20191010152619.31011-3-alexander.deucher@amd.com>
In-Reply-To: <20191010152619.31011-3-alexander.deucher@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d5cb5eb9-d679-4581-96f7-08d74e00871c
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: BN8PR12MB3459:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN8PR12MB34591AB7CDFBD0C64726934DE4970@BN8PR12MB3459.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:389;
x-forefront-prvs: 0187F3EA14
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(366004)(136003)(396003)(39860400002)(346002)(189003)(13464003)(199004)(14444005)(8936002)(256004)(81166006)(81156014)(25786009)(33656002)(55016002)(8676002)(6306002)(6436002)(66066001)(2501003)(26005)(4326008)(6246003)(476003)(3846002)(6116002)(186003)(5660300002)(486006)(52536014)(305945005)(7736002)(9686003)(66556008)(66476007)(74316002)(53546011)(66446008)(102836004)(6506007)(11346002)(99286004)(14454004)(316002)(446003)(64756008)(76116006)(478600001)(86362001)(229853002)(2906002)(71200400001)(71190400001)(110136005)(66946007)(76176011)(7696005)(966005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR12MB3459;
 H:BN8PR12MB3329.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3izWHIWIMNmQQjkhnLG+YVlkgiYfWKhRkUsQCRYNK1WpKMkLms/AxC3BTIEb99DsSMyJTrq3iSPb2HegTgqpzJ/cnU7Pg1XJnmbAN0pMBeIa/pkxYvUMEdFpJCXjrMQmtTItlU2dVBS3xWfUzsgYciSeeLnKu9JqU67S2WcULsRBjUh8EcO2oUulnn13UmdlYiWA8MvTX01xQsyA5Y7KHC2zzojbJIpTkK888332izwHoSYaKx6wORoKe6Voi6FwqYr7F987qRdxpoomhvQS0vPK2yLO0JFVoWDbEGPxdKtYNml/PB3mjAbYWTOSvyZWdknS3ZYMFp7q2NNaiEkel5zR4LAHWtMPsd9yi6pw1mQjTpEqvNJ2/cR1KznSHZ2lVYhkAkYnGngMNwriQfQwXqfiQ3ACJ9Cb++OjJFeoEFcN9Z50/PvGv3icOxujgJXIAQTSK35xjHJjtr3vYVGbQg==
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5cb5eb9-d679-4581-96f7-08d74e00871c
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Oct 2019 04:07:26.8829 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jgs7UIHzIc7KP9V7kfMN47JoH8a5DbZ/fLSJ0mcZY6QrQmY4S58P4/6u4pAuu4gu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3459
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u/rLZ7taLR2MHJGzOrPROG7vpBhoYD2abvgJ58poIAk=;
 b=Z/qQ5EDA52lBGRzGxh4Qie1Jg5Cfq1+Wr6KpFjZdBjSpogJdSCccTaMvqi9eLkbb01g6w1yFkQV5RfOpA68qENmuwj/WAGZMGViAvRoTOJvKIWE9wPB/4KxDXBkGyOe2+zkxM97EnWnvvGV3MtTYR6XqddDA/RRGh+dHJ9o6gTs=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Evan.Quan@amd.com; 
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SXQgc2VlbXMgYW1kZ3B1X3Btb3BzX3J1bnRpbWVfc3VzcGVuZCgpIG5lZWRzIHRvIGJlIHVwZGF0
ZWQgYWNjb3JkaW5nbHkgYWxzby4NCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206
IGFtZC1nZnggPGFtZC1nZngtYm91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJlaGFs
ZiBPZiBBbGV4IERldWNoZXINClNlbnQ6IFRodXJzZGF5LCBPY3RvYmVyIDEwLCAyMDE5IDExOjI2
IFBNDQpUbzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCkNjOiBEZXVjaGVyLCBBbGV4
YW5kZXIgPEFsZXhhbmRlci5EZXVjaGVyQGFtZC5jb20+DQpTdWJqZWN0OiBbUEFUQ0ggMi81XSBk
cm0vYW1kZ3B1OiBtb3ZlIGdwdSByZXNldCBvdXQgb2YgYW1kZ3B1X2RldmljZV9zdXNwZW5kDQoN
Ck1vdmUgaXQgaW50byB0aGUgY2FsbGVyLiAgVGhlcmUgYXJlIGNhc2VzIHdlcmUgd2UgZG9uJ3QN
CndhbnQgaXQuICBXZSBuZWVkIGl0IGZvciBoaWJlcm5hdGlvbiwgYnV0IHdlIGRvbid0IG5lZWQN
Cml0IGZvciBydW50aW1lIHBtLg0KDQpTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhh
bmRlci5kZXVjaGVyQGFtZC5jb20+DQotLS0NCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfZGV2aWNlLmMgfCA0IC0tLS0NCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfZHJ2LmMgICAgfCA3ICsrKysrKy0NCiAyIGZpbGVzIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygr
KSwgNSBkZWxldGlvbnMoLSkNCg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV9kZXZpY2UuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9k
ZXZpY2UuYw0KaW5kZXggOWI5YjE1MzYwMTk0Li45MWJkYjI0NmU0MDUgMTAwNjQ0DQotLS0gYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMNCisrKyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYw0KQEAgLTMxNzMsMTAgKzMxNzMsNiBA
QCBpbnQgYW1kZ3B1X2RldmljZV9zdXNwZW5kKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIGJvb2wg
c3VzcGVuZCwgYm9vbCBmYmNvbikNCiAJCS8qIFNodXQgZG93biB0aGUgZGV2aWNlICovDQogCQlw
Y2lfZGlzYWJsZV9kZXZpY2UoZGV2LT5wZGV2KTsNCiAJCXBjaV9zZXRfcG93ZXJfc3RhdGUoZGV2
LT5wZGV2LCBQQ0lfRDNob3QpOw0KLQl9IGVsc2Ugew0KLQkJciA9IGFtZGdwdV9hc2ljX3Jlc2V0
KGFkZXYpOw0KLQkJaWYgKHIpDQotCQkJRFJNX0VSUk9SKCJhbWRncHUgYXNpYyByZXNldCBmYWls
ZWRcbiIpOw0KIAl9DQogDQogCXJldHVybiAwOw0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9kcnYuYw0KaW5kZXggZDQzYzQ2ZGU3ODA3Li42NDE0MTM4NmU2MDMgMTAwNjQ0DQotLS0g
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZHJ2LmMNCisrKyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kcnYuYw0KQEAgLTExMTgsOCArMTExOCwxMyBAQCBz
dGF0aWMgaW50IGFtZGdwdV9wbW9wc19yZXN1bWUoc3RydWN0IGRldmljZSAqZGV2KQ0KIHN0YXRp
YyBpbnQgYW1kZ3B1X3Btb3BzX2ZyZWV6ZShzdHJ1Y3QgZGV2aWNlICpkZXYpDQogew0KIAlzdHJ1
Y3QgZHJtX2RldmljZSAqZHJtX2RldiA9IGRldl9nZXRfZHJ2ZGF0YShkZXYpOw0KKwlzdHJ1Y3Qg
YW1kZ3B1X2RldmljZSAqYWRldiA9IGRybV9kZXYtPmRldl9wcml2YXRlOw0KKwlpbnQgcjsNCiAN
Ci0JcmV0dXJuIGFtZGdwdV9kZXZpY2Vfc3VzcGVuZChkcm1fZGV2LCBmYWxzZSwgdHJ1ZSk7DQor
CXIgPSBhbWRncHVfZGV2aWNlX3N1c3BlbmQoZHJtX2RldiwgZmFsc2UsIHRydWUpOw0KKwlpZiAo
cikNCisJCXJldHVybiByOw0KKwlyZXR1cm4gYW1kZ3B1X2FzaWNfcmVzZXQoYWRldik7DQogfQ0K
IA0KIHN0YXRpYyBpbnQgYW1kZ3B1X3Btb3BzX3RoYXcoc3RydWN0IGRldmljZSAqZGV2KQ0KLS0g
DQoyLjIwLjENCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18NCmFtZC1nZnggbWFpbGluZyBsaXN0DQphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0K
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4DQpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1h
aWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
