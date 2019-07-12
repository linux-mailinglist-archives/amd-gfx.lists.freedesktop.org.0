Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0107D67065
	for <lists+amd-gfx@lfdr.de>; Fri, 12 Jul 2019 15:44:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 251468925F;
	Fri, 12 Jul 2019 13:44:23 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750050.outbound.protection.outlook.com [40.107.75.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36845891E7
 for <amd-gfx@lists.freedesktop.org>; Fri, 12 Jul 2019 13:44:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sg8b+uRA63mqaDFiTRKIghUGJA/3QTb0GQ8JxQ8ZBjV0+gzsdR4z1xxbY9HDfP19VRRWFHKGYJKTz+UxbcqsKXoBymeWFpVV0es7puyG+4jrH4qE7mZJHwUB3WcWpoX/d1fZ6S1JiAth4oedo55rsGvggu3q6CbKVyhoCUEBRVocbilF9JR2kPOHqgNmN3QJxhuKyN0FaiXhqChtwt1XKuz6NJRopSwk4zYq3f+PBYqCIFE6NW2Ze9ojvH7ErwqYTN4DkI/M86uKDQyE/rC42FtP8HcONdcGgxLdhgHy+k1ky4zJYJcSq2PL3GvpsI1v9bW9wOCCKfkH6YLuprRxAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ohFceH78gz8UaqU5MVx466WYhQhKoeEtQ+d2s/EFAos=;
 b=HJ7a4QqJu1xwRi6CSdckHEdq4pnF11zTiAgxZkodkBh5PyZEZxlDkzkFC6vTdsj/sC3GcAejsCVx40joxlRFoC4Xk04Fp2cLq423tUrfuqn9bkdtvsd5qCXMPmj/eXoe87CYSg6bMlz6WrQ/uTkuF0hxW5wJqL4p7wTJ1Bcfc92MTQoeNNhC3iHI1DGJS66EAd+KBcHV6ABDajA5EY5d4blcs2MjwrDqFJws2hcWZIVFWSNF0g9JcZCH5eV++j5vEeM8OdDlczx24KQRYr1h3r4fBKFHJ04PrC1dRgWBJplmq4+Y21PiA8ipHh9qM1fifn3KG1rs5u4G/EbF1DgWMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from MWHPR12MB1311.namprd12.prod.outlook.com (10.169.206.148) by
 MWHPR12MB1135.namprd12.prod.outlook.com (10.169.204.11) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.10; Fri, 12 Jul 2019 13:44:16 +0000
Received: from MWHPR12MB1311.namprd12.prod.outlook.com
 ([fe80::1894:755c:dbb2:7626]) by MWHPR12MB1311.namprd12.prod.outlook.com
 ([fe80::1894:755c:dbb2:7626%7]) with mapi id 15.20.2052.022; Fri, 12 Jul 2019
 13:44:16 +0000
From: "StDenis, Tom" <Tom.StDenis@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 2/2] drm/amd/amdgpu: Add missing select_me_pipe_q() for gfx10
Thread-Topic: [PATCH 2/2] drm/amd/amdgpu: Add missing select_me_pipe_q() for
 gfx10
Thread-Index: AQHVOLfl/qFFu67bKEaZ/9Hkhg+OQw==
Date: Fri, 12 Jul 2019 13:44:16 +0000
Message-ID: <20190712134406.30374-2-tom.stdenis@amd.com>
References: <20190712134406.30374-1-tom.stdenis@amd.com>
In-Reply-To: <20190712134406.30374-1-tom.stdenis@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: MN2PR07CA0003.namprd07.prod.outlook.com
 (2603:10b6:208:1a0::13) To MWHPR12MB1311.namprd12.prod.outlook.com
 (2603:10b6:300:13::20)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.21.0
x-originating-ip: [165.204.84.11]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b503b757-fc7c-4bec-d2a0-08d706cf0825
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MWHPR12MB1135; 
x-ms-traffictypediagnostic: MWHPR12MB1135:
x-microsoft-antispam-prvs: <MWHPR12MB1135F7E3867D84FC0513D3F2F7F20@MWHPR12MB1135.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:254;
x-forefront-prvs: 00963989E5
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(376002)(39860400002)(136003)(396003)(346002)(199004)(189003)(316002)(305945005)(64756008)(8676002)(66446008)(66556008)(66946007)(66476007)(5660300002)(81156014)(71190400001)(71200400001)(6916009)(81166006)(7736002)(66066001)(256004)(2616005)(486006)(478600001)(68736007)(446003)(476003)(1076003)(50226002)(8936002)(11346002)(2906002)(102836004)(14454004)(25786009)(53936002)(6506007)(386003)(36756003)(26005)(186003)(2501003)(6486002)(99286004)(76176011)(86362001)(52116002)(4326008)(6436002)(5640700003)(2351001)(3846002)(6116002)(6512007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1135;
 H:MWHPR12MB1311.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 4s68BkJllVi3693DCDmJYC8x7hsg66d4G1AJLqbA2uEgDtlNBWxIGwYgyIyBmT1MwQGQ8DmrvsuAYt0rfLnqHLhyo90w1Oh1dMTjIOAju8Y3KX10nnYmX2Zvv3hYf+SWEelZohVTOCmt+sCet8p3cLBlrQJOAtT+MQ80PDnYzVYozjVHCETV2iSBbROtgEsCjB+qhWFJCMsmqWsnkEVkHxKABw+JOkO1eIo+nmjm62meOBjRuMDFjbQ6xl6RENKditpgmQhyaa2SdNMrkAU2wyL7wwhc7On4/CaRajVn0J9Y66wslzQETILH6aSgv+xP5rA9rU6EcNWJzJzL4XNzxWi94wPHFoRziYGy3F7ghc6KsG+s4aEzNH19wFjgp2fTTNMgWztGWNa3nspCkFpEDIwDvouD3BxU32WjsJPNIe0=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b503b757-fc7c-4bec-d2a0-08d706cf0825
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jul 2019 13:44:16.4611 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tstdenis@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1135
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ohFceH78gz8UaqU5MVx466WYhQhKoeEtQ+d2s/EFAos=;
 b=h4RKC5wcQ3QihvV1HdUIeXzc+NRpmAVi5rdAzETnZ1cvexoBA/9dl7F45XlQpABS0CM1g3mwh+Pr4ae3g6Ba7lLur8RwPTLNTahFkgmmo+u9m+t2JvEBuo65KPq++uy7LDNhXtgnqqfA573aY2SaqiY8c/eYdGEETbzVFQbLDNE=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Tom.StDenis@amd.com; 
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

U2lnbmVkLW9mZi1ieTogVG9tIFN0IERlbmlzIDx0b20uc3RkZW5pc0BhbWQuY29tPgotLS0KIGRy
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92MTBfMC5jIHwgNyArKysrKysrCiAxIGZpbGUg
Y2hhbmdlZCwgNyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvZ2Z4X3YxMF8wLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjEw
XzAuYwppbmRleCAwZDk0YzgxMmRmMWIuLjdkNTIwN2JiZTM4MiAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3YxMF8wLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvZ2Z4X3YxMF8wLmMKQEAgLTEwNjEsNiArMTA2MSwxMiBAQCBzdGF0aWMgdm9pZCBn
ZnhfdjEwXzBfcmVhZF93YXZlX3ZncHJzKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LCB1aW50
MzJfdCBzaW1kLAogCQlzdGFydCArIFNRSU5EX1dBVkVfVkdQUlNfT0ZGU0VULCBzaXplLCBkc3Qp
OwogfQogCitzdGF0aWMgdm9pZCBnZnhfdjEwXzBfc2VsZWN0X21lX3BpcGVfcShzdHJ1Y3QgYW1k
Z3B1X2RldmljZSAqYWRldiwKKwkJCQkJCQkJCSAgdTMyIG1lLCB1MzIgcGlwZSwgdTMyIHEsIHUz
MiB2bSkKKyB7CisgICAgICAgbnZfZ3JibV9zZWxlY3QoYWRldiwgbWUsIHBpcGUsIHEsIHZtKTsK
KyB9CisKIAogc3RhdGljIGNvbnN0IHN0cnVjdCBhbWRncHVfZ2Z4X2Z1bmNzIGdmeF92MTBfMF9n
ZnhfZnVuY3MgPSB7CiAJLmdldF9ncHVfY2xvY2tfY291bnRlciA9ICZnZnhfdjEwXzBfZ2V0X2dw
dV9jbG9ja19jb3VudGVyLApAQCAtMTA2OCw2ICsxMDc0LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVj
dCBhbWRncHVfZ2Z4X2Z1bmNzIGdmeF92MTBfMF9nZnhfZnVuY3MgPSB7CiAJLnJlYWRfd2F2ZV9k
YXRhID0gJmdmeF92MTBfMF9yZWFkX3dhdmVfZGF0YSwKIAkucmVhZF93YXZlX3NncHJzID0gJmdm
eF92MTBfMF9yZWFkX3dhdmVfc2dwcnMsCiAJLnJlYWRfd2F2ZV92Z3BycyA9ICZnZnhfdjEwXzBf
cmVhZF93YXZlX3ZncHJzLAorCS5zZWxlY3RfbWVfcGlwZV9xID0gJmdmeF92MTBfMF9zZWxlY3Rf
bWVfcGlwZV9xLAogfTsKIAogc3RhdGljIHZvaWQgZ2Z4X3YxMF8wX2dwdV9lYXJseV9pbml0KHN0
cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQotLSAKMi4yMS4wCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2FtZC1nZng=
