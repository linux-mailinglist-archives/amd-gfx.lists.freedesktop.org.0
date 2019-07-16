Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 20F8F6AC4D
	for <lists+amd-gfx@lfdr.de>; Tue, 16 Jul 2019 17:55:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A569389E4C;
	Tue, 16 Jul 2019 15:55:19 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710079.outbound.protection.outlook.com [40.107.71.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3028089E4C
 for <amd-gfx@lists.freedesktop.org>; Tue, 16 Jul 2019 15:55:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J8vYiewj1uIjV8m0uCpG/EUHZ8pHmDyfjSWui/wEQ8+2XuyvYtgTaOLkV440yXZmzFYI+rL6KBd0nEkvdfwRng7ZpzpOdDCULjEr6+Bhg4MwlPo7ipSNpCu0aFMqh0hF9eSt81CE0iWN9H9drErhhPSDVfV+hLcPNmWt0T97kLP2czRT0OzNETPmSBrKvneI3RtrWzEbC6PUfe7tBeVUgxB1NzgOSntIcylCGleZefbo5M307ZX2jQR/lwdNRuzO+0IyiS7mJMMDNS5Bbjh0IleuqfniKKhO2lbLD/e0h3D0HP9edpPloaE36YshqeJxTUvdpM0qJn3svjK4ry7VrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3n4UjNGRsH+gZZOzlkI2aKNh5942V/cWXU1X8nDpks0=;
 b=EPTlImw6KtIJVR/+ZX5s5gN0YoeR08lWiiK4bUbisrwHhOB9HCGaEGTXtAeHSBNcLPU6h5lOUSoLSsr+fRbtY0xbsy3lbrngp5iRpdR4iuF+U0lJugZgqP0TTu0ZcccACD3AdBVLO+YXq+n3701gxjtvki557tmmPNT0MnoGjQqy/sNQ4NW3M5nBU8EGk5RY1WRBeT4mOYObutA1ZkwOdKaYrhoGVnslAD8T67boofg/kvKTjAErrnCFujojaFi1osrtGa8q8/a1gclAR1hoPQ4BwjGj23JbgjLEC2pHZt4sxcWZjjmPCj0UewxwZmD9UEm4LQs5ah3O43Hv6x5SvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from BN8PR12MB3602.namprd12.prod.outlook.com (20.178.212.86) by
 BN8PR12MB2850.namprd12.prod.outlook.com (20.179.64.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Tue, 16 Jul 2019 15:55:15 +0000
Received: from BN8PR12MB3602.namprd12.prod.outlook.com
 ([fe80::8d31:f3d2:a080:9a9c]) by BN8PR12MB3602.namprd12.prod.outlook.com
 ([fe80::8d31:f3d2:a080:9a9c%5]) with mapi id 15.20.2073.012; Tue, 16 Jul 2019
 15:55:15 +0000
From: "Yuan, Xiaojie" <Xiaojie.Yuan@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amdgpu/psp11: check if prior to navi10 for sram map
Thread-Topic: [PATCH] drm/amdgpu/psp11: check if prior to navi10 for sram map
Thread-Index: AQHVO+7cMl0QvSNM2Uq8jyBjFUD2Hw==
Date: Tue, 16 Jul 2019 15:55:15 +0000
Message-ID: <20190716155456.11236-1-xiaojie.yuan@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK0PR01CA0003.apcprd01.prod.exchangelabs.com
 (2603:1096:203:92::15) To BN8PR12MB3602.namprd12.prod.outlook.com
 (2603:10b6:408:49::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.20.1
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8f4367b0-62a7-47cf-e62c-08d70a05fe41
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BN8PR12MB2850; 
x-ms-traffictypediagnostic: BN8PR12MB2850:
x-microsoft-antispam-prvs: <BN8PR12MB2850D18AB7C3D5D7C7E57BF589CE0@BN8PR12MB2850.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:346;
x-forefront-prvs: 0100732B76
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(39860400002)(396003)(366004)(346002)(376002)(199004)(189003)(2616005)(476003)(66946007)(1076003)(66476007)(66446008)(66556008)(64756008)(71190400001)(2501003)(71200400001)(102836004)(26005)(86362001)(8936002)(50226002)(52116002)(81166006)(81156014)(54906003)(316002)(386003)(6506007)(4326008)(186003)(256004)(5660300002)(2906002)(25786009)(14454004)(99286004)(2351001)(5640700003)(478600001)(305945005)(6486002)(3846002)(6512007)(53936002)(6116002)(8676002)(6916009)(486006)(36756003)(66066001)(68736007)(7736002)(6436002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR12MB2850;
 H:BN8PR12MB3602.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ISxEfKQyEsvYKLLU2C7x5X5yLwr0ouhnlSPrjZ13cE1OlpHrbcQrX2T6rtF+zAnOpaRp/Trc4oj6dRdHJyWR5r+u0f5OKEVvTHiIlDpzQ/3A6B7mWta2fZ8K0ROlYPH/ZOgOziZPUq7a2SZSBeFiMuJ6qXu9DNxXorQcgn/g2OMeHiALXNZwgi3U7AMj2+GIz0fEYo0FUUGC4v/1yRd2LMGUyeys6MsxclZAf2NR8E0/0ke5wqs1JggeN/Bz+AVNzY0lhOOm//vcO4OarBSjNHgo3WeSLUuJBhKfHeexTfjFR8Rn3fMpRCjGHtJsz+G2OIz4FNivtAPyrjMPp1ZBvIyH8LwUYBSui+qrFP8F/Vgmo/FQHP8zF9mY+z5sN2ySNWQhMW+BzGljjlct8+ljHYKFAzvvNIGhG5D/D2H9bZY=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f4367b0-62a7-47cf-e62c-08d70a05fe41
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jul 2019 15:55:15.7607 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xiyuan@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB2850
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3n4UjNGRsH+gZZOzlkI2aKNh5942V/cWXU1X8nDpks0=;
 b=TDGzmCh93F7OX5vyYrU08B7CbhDLHIIZpTzQUS7jocBeJCSwEtTKJKO86SDthL26W/QGriKN956VsHypZiYFNmlx0VAzz+uw4EnjhlLS4zke57bEEZhOV/qonsgW6JLl/TC4Uo3OpUky4LohPZj2BqPJ1RFWww2rO3UrIgYnAsk=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Xiaojie.Yuan@amd.com; 
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
Cc: "tao1.zhou@amd.com" <tao1.zhou@amd.com>, "Xiao, Jack" <Jack.Xiao@amd.com>,
 "Yuan, Xiaojie" <Xiaojie.Yuan@amd.com>, "Zhang,
 Hawking" <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

U2lnbmVkLW9mZi1ieTogWGlhb2ppZSBZdWFuIDx4aWFvamllLnl1YW5AYW1kLmNvbT4KLS0tCiBk
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9wc3BfdjExXzAuYyB8IDQgKystLQogMSBmaWxlIGNo
YW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9wc3BfdjExXzAuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L3BzcF92MTFfMC5jCmluZGV4IDg3NTk2YzY5YjIzNS4uYThiNTI2ZGJiNmM2IDEwMDY0
NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9wc3BfdjExXzAuYworKysgYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9wc3BfdjExXzAuYwpAQCAtNTM4LDcgKzUzOCw3IEBAIHBz
cF92MTFfMF9zcmFtX21hcChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKIAogCWNhc2UgQU1E
R1BVX1VDT0RFX0lEX1JMQ19HOgogCQkqc3JhbV9vZmZzZXQgPSAweDIwMDA7Ci0JCWlmIChhZGV2
LT5hc2ljX3R5cGUgIT0gQ0hJUF9OQVZJMTApIHsKKwkJaWYgKGFkZXYtPmFzaWNfdHlwZSA8IENI
SVBfTkFWSTEwKSB7CiAJCQkqc3JhbV9hZGRyX3JlZ19vZmZzZXQgPSBTT0MxNV9SRUdfT0ZGU0VU
KEdDLCAwLCBtbVJMQ19HUE1fVUNPREVfQUREUik7CiAJCQkqc3JhbV9kYXRhX3JlZ19vZmZzZXQg
PSBTT0MxNV9SRUdfT0ZGU0VUKEdDLCAwLCBtbVJMQ19HUE1fVUNPREVfREFUQSk7CiAJCX0KQEAg
LTU1MCw3ICs1NTAsNyBAQCBwc3BfdjExXzBfc3JhbV9tYXAoc3RydWN0IGFtZGdwdV9kZXZpY2Ug
KmFkZXYsCiAKIAljYXNlIEFNREdQVV9VQ09ERV9JRF9TRE1BMDoKIAkJKnNyYW1fb2Zmc2V0ID0g
MHgwOwotCQlpZiAoYWRldi0+YXNpY190eXBlICE9IENISVBfTkFWSTEwKSB7CisJCWlmIChhZGV2
LT5hc2ljX3R5cGUgPCBDSElQX05BVkkxMCkgewogCQkJKnNyYW1fYWRkcl9yZWdfb2Zmc2V0ID0g
U09DMTVfUkVHX09GRlNFVChTRE1BMCwgMCwgbW1TRE1BMF9VQ09ERV9BRERSKTsKIAkJCSpzcmFt
X2RhdGFfcmVnX29mZnNldCA9IFNPQzE1X1JFR19PRkZTRVQoU0RNQTAsIDAsIG1tU0RNQTBfVUNP
REVfREFUQSk7CiAJCX0KLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9hbWQtZ2Z4
