Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CED0BD4D1
	for <lists+amd-gfx@lfdr.de>; Wed, 25 Sep 2019 00:13:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72D0989FA9;
	Tue, 24 Sep 2019 22:13:54 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780041.outbound.protection.outlook.com [40.107.78.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15A3289FA9
 for <amd-gfx@lists.freedesktop.org>; Tue, 24 Sep 2019 22:13:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H5Y9RMfsPVjflcL+qWccqbiWKcttqXj6l4EXJh3VmVBjTfLPzIFLxWCV+mWNMNxvh16ooKvgrR3NIXTRQkW59to27OozI49MiJM6YvSddnAW9/F7G+eBavYLE1qwPt9Y8Rr1vCufBDb8nxpUsHLWIfHqvyKmqWmznrfEgLzObQnBjC71BMYuMCWxOYn2rLHs9lnUjLNa4fgNgY9bEffqYF05ScHpipcD3c3S+1oPSng9cgaKVdqS/9UgF4mxe55J+CGn/40h+pc73syD9gYWPM7qi5lENCzvjHwFHDw0siZvUEedJsORo2gRqbN26zbR/V8pu4peAxVmIk0hAY1MMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fHv8eMnmoa7B6Knpyh/IyDBp2lTk1fWhO8ByevBHneg=;
 b=LlWF4mzAOXbmzoPoGScau1cu5alSeYoF4VlaEquB5sIYvulQIOu8Ju/w+xsCHWlVFz+xRwBAlmgFd03O3DytxRUgkiXV/AMfvRcgUtUabuPVx2GyP3N9B8bI6YTvdhM2X1TyUD0dNCmvNglvpvusKRKebnj8F39XOqKrRsbB7VY25DG/Hm7KrQcW+b07b5k29UgXBXy8PB+L/8hmnv4V1VvtTwoB5CA7nX4FWtYh5HR1cFJWLY7O53HF0ocpruX/862jnbypu0h7aA55bWC1bY4+L1Yn3Qo901jQNArKYO3MmWJF7T+iX2D3w/R7oUYO1TUHAVO6xyczOTfGXfHH/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM6PR12MB3241.namprd12.prod.outlook.com (20.179.105.153) by
 DM6PR12MB2745.namprd12.prod.outlook.com (20.176.117.74) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.20; Tue, 24 Sep 2019 22:13:51 +0000
Received: from DM6PR12MB3241.namprd12.prod.outlook.com
 ([fe80::78b5:3af4:e88d:25fd]) by DM6PR12MB3241.namprd12.prod.outlook.com
 ([fe80::78b5:3af4:e88d:25fd%7]) with mapi id 15.20.2284.023; Tue, 24 Sep 2019
 22:13:51 +0000
From: "Liu, Shaoyun" <Shaoyun.Liu@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amdgpu: Add NAVI12 support from kfd side
Thread-Topic: [PATCH] drm/amdgpu: Add NAVI12 support from kfd side
Thread-Index: AQHVcyVY+HhwweOsFky1b/6VDbMwBQ==
Date: Tue, 24 Sep 2019 22:13:51 +0000
Message-ID: <1569363225-18469-1-git-send-email-shaoyun.liu@amd.com>
Accept-Language: en-CA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
x-clientproxiedby: YTXPR0101CA0022.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::35) To DM6PR12MB3241.namprd12.prod.outlook.com
 (2603:10b6:5:186::25)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.7.4
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e084a050-858d-4acd-d455-08d7413c7b11
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:DM6PR12MB2745; 
x-ms-traffictypediagnostic: DM6PR12MB2745:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB2745FB2E4E3B6B924F62CEBBF4840@DM6PR12MB2745.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1186;
x-forefront-prvs: 0170DAF08C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(136003)(396003)(346002)(39860400002)(366004)(189003)(199004)(26005)(66946007)(6916009)(50226002)(8936002)(102836004)(52116002)(305945005)(256004)(186003)(99286004)(386003)(71190400001)(4326008)(7736002)(5660300002)(66446008)(66066001)(5640700003)(66556008)(81166006)(71200400001)(64756008)(86362001)(6506007)(2501003)(478600001)(66476007)(81156014)(2351001)(8676002)(36756003)(14454004)(3846002)(486006)(2616005)(476003)(2906002)(6116002)(6512007)(316002)(6436002)(6486002)(25786009);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB2745;
 H:DM6PR12MB3241.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 1BTYS0YYkrfOvnAZkwkcYUnCojKpQr5sL7URj1q1g6yKbe0ZeYlwL54qRvSKrjmDZ7jjvqsrcBViN5aA+FmnmxJYciZ3FvV6eB9lSYWaZwUtPDq9nz3iBSgdoX96SBhA30xDKPtgBmzuFy4HC2vHseABLcBtWDN3GG9Vah31wXloH6VVS+7KijY5DVAxbGTZpzxHxUDd1oU9UXbx7zr0FIEVg9VF3TG2q0BN8JKPvKd1PwPQhD2/a38MVkQ/eX9gAN8gy5rXi8ZEEWqJQz1Ql5ApyNV6+pgGVgbaSwY46vC9cqMSbOwu1eKpXKu2PEFNvpnGSNhYws52TC0h3wFwC6JejCbzSQTyU4sAZvpfxh8GpMhK3RyKJ1ypzeIfgJqkwLrztFHp107Db0zkekLYU9joY7/PnQ/32J17vD6Sn7M=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e084a050-858d-4acd-d455-08d7413c7b11
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Sep 2019 22:13:51.6452 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TbCW8ru0LrzoEg8AY597JUYsVbcAnDPnh2IERWSOq7IS3rODK3eYKxgS2VOPEYFBuTAg79M07WOl4EFJstlqEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2745
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fHv8eMnmoa7B6Knpyh/IyDBp2lTk1fWhO8ByevBHneg=;
 b=DKstigf8OsShdYZljajTRFni7FblHyCqF2J9H0O6XCTNmCAPhzdUJ62JRLi1gCOIiRPwEc+k6amjM1IF4BzV8GwHMQhalpy5ZghKDFSTBj4kgPud4ajHURAFNzmDwuTbi0wD7fEOK8qqr5C5kv57WHwpsJgrcU7BFrt+25a0eig=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Shaoyun.Liu@amd.com; 
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
Cc: "Liu, Shaoyun" <Shaoyun.Liu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QWRkIGRldmljZSBpbmZvIGZvciBib3RoIG5hdmkxMiBQRiBhbmQgVkYKCkNoYW5nZS1JZDogSWZi
NDAzNWU2NWMxMmQxNTNmYzMwZTU5M2ZlMTA5ZjljN2UwNTQxZjQKU2lnbmVkLW9mZi1ieTogc2hh
b3l1bmwgPHNoYW95dW4ubGl1QGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRr
ZmQva2ZkX2RldmljZS5jIHwgMTkgKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQs
IDE5IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtm
ZC9rZmRfZGV2aWNlLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfZGV2aWNlLmMK
aW5kZXggZjMyOWI4Mi4uZWRmYmFlNWMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1ka2ZkL2tmZF9kZXZpY2UuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRf
ZGV2aWNlLmMKQEAgLTM4Nyw2ICszODcsMjQgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBrZmRfZGV2
aWNlX2luZm8gbmF2aTEwX2RldmljZV9pbmZvID0gewogCS5udW1fc2RtYV9xdWV1ZXNfcGVyX2Vu
Z2luZSA9IDgsCiB9OwogCitzdGF0aWMgY29uc3Qgc3RydWN0IGtmZF9kZXZpY2VfaW5mbyBuYXZp
MTJfZGV2aWNlX2luZm8gPSB7CisJLmFzaWNfZmFtaWx5ID0gQ0hJUF9OQVZJMTIsCisJLmFzaWNf
bmFtZSA9ICJuYXZpMTIiLAorCS5tYXhfcGFzaWRfYml0cyA9IDE2LAorCS5tYXhfbm9fb2ZfaHFk
ICA9IDI0LAorCS5kb29yYmVsbF9zaXplICA9IDgsCisJLmloX3JpbmdfZW50cnlfc2l6ZSA9IDgg
KiBzaXplb2YodWludDMyX3QpLAorCS5ldmVudF9pbnRlcnJ1cHRfY2xhc3MgPSAmZXZlbnRfaW50
ZXJydXB0X2NsYXNzX3Y5LAorCS5udW1fb2Zfd2F0Y2hfcG9pbnRzID0gNCwKKwkubXFkX3NpemVf
YWxpZ25lZCA9IE1RRF9TSVpFX0FMSUdORUQsCisJLm5lZWRzX2lvbW11X2RldmljZSA9IGZhbHNl
LAorCS5zdXBwb3J0c19jd3NyID0gdHJ1ZSwKKwkubmVlZHNfcGNpX2F0b21pY3MgPSBmYWxzZSwK
KwkubnVtX3NkbWFfZW5naW5lcyA9IDIsCisJLm51bV94Z21pX3NkbWFfZW5naW5lcyA9IDAsCisJ
Lm51bV9zZG1hX3F1ZXVlc19wZXJfZW5naW5lID0gOCwKK307CisKIHN0YXRpYyBjb25zdCBzdHJ1
Y3Qga2ZkX2RldmljZV9pbmZvIG5hdmkxNF9kZXZpY2VfaW5mbyA9IHsKIAkuYXNpY19mYW1pbHkg
PSBDSElQX05BVkkxNCwKIAkuYXNpY19uYW1lID0gIm5hdmkxNCIsCkBAIC00MjUsNiArNDQzLDcg
QEAgc3RhdGljIGNvbnN0IHN0cnVjdCBrZmRfZGV2aWNlX2luZm8gKmtmZF9zdXBwb3J0ZWRfZGV2
aWNlc1tdWzJdID0gewogCVtDSElQX1JFTk9JUl0gPSB7JnJlbm9pcl9kZXZpY2VfaW5mbywgTlVM
TH0sCiAJW0NISVBfQVJDVFVSVVNdID0geyZhcmN0dXJ1c19kZXZpY2VfaW5mbywgJmFyY3R1cnVz
X2RldmljZV9pbmZvfSwKIAlbQ0hJUF9OQVZJMTBdID0geyZuYXZpMTBfZGV2aWNlX2luZm8sIE5V
TEx9LAorCVtDSElQX05BVkkxMl0gPSB7Jm5hdmkxMl9kZXZpY2VfaW5mbywgJm5hdmkxMl9kZXZp
Y2VfaW5mb30sCiAJW0NISVBfTkFWSTE0XSA9IHsmbmF2aTE0X2RldmljZV9pbmZvLCBOVUxMfSwK
IH07CiAKLS0gCjIuNy40CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
