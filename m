Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6F8EB71E9
	for <lists+amd-gfx@lfdr.de>; Thu, 19 Sep 2019 05:30:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 632A76F95D;
	Thu, 19 Sep 2019 03:30:49 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790058.outbound.protection.outlook.com [40.107.79.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFD926F95D
 for <amd-gfx@lists.freedesktop.org>; Thu, 19 Sep 2019 03:30:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qo6iI3RCWfh/knim4yAqcoabKm5DmEu5NPgzXQdVa206dBCPALcuEBIDiC1eDjactq7yOPjw5oWfeepvGY8NFufMAFGEAYfr4XrFm4mKFrTnHgC1MgGN6ChVqtJq6bvDxo27Cai5Vhgqw/oPDegJWp7G1+LQRGLePcXqdewQyshFiczhW62nbc5kuAqGgRgQAbPz80N9QbM16XN9c+fawThMI5Hm0gx6ZoHwBjxXLGVSnK5hxHmGeesgKlFgBTDEwA6AwgqqWf/WHlrlAvSUDi2UBeyU6DytjiyzD+YJfoU7S2rr+Dyl6c+t5YKLWLgL/NP8JgIzQr6NKzD7rD/mjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rTJCR55GkX0CvXgTtMSyIJWMUj+oTXH0KBWd1XCCOrk=;
 b=AeEpjfja/lNn2iXxD4le7+unlJOjJ08x3KM+ecsFKFcycHdJDiMx7tWx0DoxcED75kcxapf37AtbMysmkFQ/7ob30qpY6Lo+vomaUF+o68aQUoJiaGuFAjtqzQAOQSi9ka5XYxYkXJDmRLoMMYkMFi39Cgk4BEAfhiflCpBJYTvwZgM1F/8rMMC7HXiKhhZ6Azr9aCkd4gIDzYqDFBqDouk6NNyY8CBvytGO0n1gyPP0zoPColYeptc72jtehu1tqyLvXYEwCKR2hJAettrXoDQ4JRWLWoFr+kksMB7j4UJuQgyyYX5+P2GRy7ShDSeWgyHG7XzI8KbqnY8Kpv1YUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB1418.namprd12.prod.outlook.com (10.168.240.15) by
 DM5PR12MB2343.namprd12.prod.outlook.com (52.132.140.166) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.17; Thu, 19 Sep 2019 03:30:45 +0000
Received: from DM5PR12MB1418.namprd12.prod.outlook.com
 ([fe80::7c63:a72:e42d:c97d]) by DM5PR12MB1418.namprd12.prod.outlook.com
 ([fe80::7c63:a72:e42d:c97d%7]) with mapi id 15.20.2263.023; Thu, 19 Sep 2019
 03:30:45 +0000
From: "Zhang, Hawking" <Hawking.Zhang@amd.com>
To: "Chen, Guchun" <Guchun.Chen@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "Zhou1, Tao" <Tao.Zhou1@amd.com>,
 "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>
Subject: RE: [PATCH] drm/amdgpu: enable full ras by default
Thread-Topic: [PATCH] drm/amdgpu: enable full ras by default
Thread-Index: AQHVbphsHrQFEaRd+EqgEbUQy6y/cacyV/AQ
Date: Thu, 19 Sep 2019 03:30:45 +0000
Message-ID: <DM5PR12MB14182A2669789A3B985B7626FC890@DM5PR12MB1418.namprd12.prod.outlook.com>
References: <20190919031444.8203-1-guchun.chen@amd.com>
In-Reply-To: <20190919031444.8203-1-guchun.chen@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [223.104.253.30]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e086dabb-810e-4d27-3caa-08d73cb1c1e7
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:DM5PR12MB2343; 
x-ms-traffictypediagnostic: DM5PR12MB2343:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR12MB2343A4DC13AF351B6AD8E0BAFC890@DM5PR12MB2343.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:628;
x-forefront-prvs: 016572D96D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(376002)(366004)(136003)(39860400002)(346002)(13464003)(199004)(189003)(81166006)(14454004)(7696005)(6506007)(6246003)(478600001)(81156014)(4744005)(53546011)(11346002)(71200400001)(71190400001)(6116002)(186003)(3846002)(4326008)(102836004)(66066001)(25786009)(316002)(2501003)(2906002)(99286004)(74316002)(5660300002)(110136005)(9686003)(256004)(76116006)(66946007)(66476007)(76176011)(26005)(33656002)(446003)(66446008)(7736002)(14444005)(66556008)(8936002)(64756008)(55016002)(229853002)(52536014)(305945005)(8676002)(486006)(6436002)(86362001)(6636002)(476003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB2343;
 H:DM5PR12MB1418.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 2cUobN/Et9KY6Qs7yRw23Ma53U+Ku9TBg2ONGbuYdcBNTC7J7SgXdGzqL1Rq2PsiUKPhgfiUEt+UBbvxWyUA0hj3fSwd/ntN5MENbYMXikb5+eKbiq4BGa79J0WrW/xg378yr1X7iqYTWLQ6z0Q8FnK3NXX9aDIt+TrSwchsPUYF5R/3mNiOrVIbgvWWXdb8FqWGyIjK0A5wkl67kq0ZfRCMts+eq8V+FPHNNwwy4J2xzX2oPH5aM0yajLIn1f1EzUb1fkKR12DbcIqVpbpkaaNIxBiIlJitx+Y8bELr3F38x4yCJkzGjVbWBZcmxcSk4CxaJmgNp0G3Q9gt1wry6G3OCUe+Y4ux/ilvOLUELTiTa/yzZuoy04SIY7e2SsSI0afkN3Efk+Dl4+HBLr8aGNDWdJKZRykazDdrKq63Vdk=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e086dabb-810e-4d27-3caa-08d73cb1c1e7
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Sep 2019 03:30:45.5659 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: f5Wjn4fY+Zg9YJq0zrDKSURoOKCrohiEucihF+MLhcrBZzSOS5mZXGpGFtpYTHa6KH1CPKqIeOAERm9LoYRSqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2343
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rTJCR55GkX0CvXgTtMSyIJWMUj+oTXH0KBWd1XCCOrk=;
 b=4M073GeaczvJGJfMJur6wA4aiWWFKWNyxsWZfhbH1DiMco8Go/4v1OcILJ0hT67Q4m1VIinzwvPpvPw4ooPtbzy2G3G8aJaygzDLgbi60zd9ppC8SuzRgM+pYvhw/u+sc3kWz+2GKXXcnOFLAc0Yplh/JL+q9SAuCSBU9t/UrkI=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Hawking.Zhang@amd.com; 
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
Cc: "Li, Candice" <Candice.Li@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IEhhd2tpbmcgWmhhbmcgPEhhd2tpbmcuWmhhbmdAYW1kLmNvbT4NCg0KUmVn
YXJkcywNCkhhd2tpbmcNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBDaGVuLCBH
dWNodW4gPEd1Y2h1bi5DaGVuQGFtZC5jb20+IA0KU2VudDogMjAxOeW5tDnmnIgxOeaXpSAxMTox
NQ0KVG86IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBaaGFuZywgSGF3a2luZyA8SGF3
a2luZy5aaGFuZ0BhbWQuY29tPjsgWmhvdTEsIFRhbyA8VGFvLlpob3UxQGFtZC5jb20+OyBHcm9k
em92c2t5LCBBbmRyZXkgPEFuZHJleS5Hcm9kem92c2t5QGFtZC5jb20+DQpDYzogTGksIENhbmRp
Y2UgPENhbmRpY2UuTGlAYW1kLmNvbT47IENoZW4sIEd1Y2h1biA8R3VjaHVuLkNoZW5AYW1kLmNv
bT4NClN1YmplY3Q6IFtQQVRDSF0gZHJtL2FtZGdwdTogZW5hYmxlIGZ1bGwgcmFzIGJ5IGRlZmF1
bHQNCg0KRW5hYmxlIGZ1bGwgcmFzIGJ5IGRlZmF1bHQsIHVzZXIgZG9lcyBub3QgbmVlZCB0byBl
bmFibGUgaXQgYnkgYm9vdCBwYXJhbWV0ZXIuDQoNClNpZ25lZC1vZmYtYnk6IEd1Y2h1biBDaGVu
IDxndWNodW4uY2hlbkBhbWQuY29tPg0KLS0tDQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X2Rydi5jIHwgMiArLQ0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBk
ZWxldGlvbigtKQ0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X2Rydi5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5jDQppbmRl
eCA0MjA4ODhlOTQxZGYuLmRkM2I1ZGZhYWE3MCAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV9kcnYuYw0KKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X2Rydi5jDQpAQCAtMTUwLDcgKzE1MCw3IEBAIHN0cnVjdCBhbWRncHVfbWdwdV9p
bmZvIG1ncHVfaW5mbyA9IHsNCiAJLm11dGV4ID0gX19NVVRFWF9JTklUSUFMSVpFUihtZ3B1X2lu
Zm8ubXV0ZXgpLA0KIH07DQogaW50IGFtZGdwdV9yYXNfZW5hYmxlID0gLTE7DQotdWludCBhbWRn
cHVfcmFzX21hc2sgPSAweGZmZmZmZmZiOw0KK3VpbnQgYW1kZ3B1X3Jhc19tYXNrID0gMHhmZmZm
ZmZmZjsNCiANCiAvKioNCiAgKiBET0M6IHZyYW1saW1pdCAoaW50KQ0KLS0NCjIuMTcuMQ0KDQpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1h
aWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
