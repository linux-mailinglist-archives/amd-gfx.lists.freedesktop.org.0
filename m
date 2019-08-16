Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 349D59065B
	for <lists+amd-gfx@lfdr.de>; Fri, 16 Aug 2019 19:01:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCDE36E35B;
	Fri, 16 Aug 2019 17:01:51 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700043.outbound.protection.outlook.com [40.107.70.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7013E6E35B
 for <amd-gfx@lists.freedesktop.org>; Fri, 16 Aug 2019 17:01:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E5zls1MyHCOpefHsaYRngQQ2gu9hK4V82qvCcXPwnai4pd1JqA+UAcYH0jdCsbXg1cQ2bb4dniciBhTpPCuzyOV5dGqRBPEPi39W57C74/k+QkVJjAt8dVKi7wF791VhDOxfgBqY+lO85eP/fPq2x4PCG0cLTosi6z8IlIGNdStwSjzE4I22JlW2pgv//A7n/qrdKsAf7x6Q9WAl7sFneoCTtgCiL+H0qwzVBlEzDMNUL5S41gqktGW5HaJzFgBprLQPd/LWc6XAHpK8I98qmGI2Lt1TKePEEn1sB9yN1Cj59BFXWElaHwWGlvCzUV40J8aFTic7t9S+BJ19gZ1XzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vvnc/p/zVFS+SRj6R3vLg3APpN04IiSAbctNaTcXyv0=;
 b=fr9l5Hx0Qt04xeKYMYmkg6d5ZZ7V17EvdouHy5l4fn+Yy/J2ilQEzs1cVAwplmbl/IM4AYLvYMJiWbvn4o7x0IcBmOFucxZhaXsSsaXz07LUh5m7QJ29XssKEsj3NHHmLQG8ci2jV7Eqc4mKGMFRTr61T87ZL7ur3R5xxtdreiF6jLJRIouihbMZdDim2RGjoZ8l0RnaaKLdxW5gLP7ux9vMUWnrRfi8lnf7ca1++FbJobCzESPwDL7idIhT7y9wkthjiS/GzFkhPnyqHSc/sOhC421VJ06OT5n1zLP7bU1DbDGwEEKIoyYqrRnbSQHACUJ+2pTW9A0e+3BhJLyhQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MWHPR12MB1311.namprd12.prod.outlook.com (10.169.206.148) by
 MWHPR12MB1598.namprd12.prod.outlook.com (10.172.50.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.18; Fri, 16 Aug 2019 17:01:47 +0000
Received: from MWHPR12MB1311.namprd12.prod.outlook.com
 ([fe80::d4:45bf:a43b:6959]) by MWHPR12MB1311.namprd12.prod.outlook.com
 ([fe80::d4:45bf:a43b:6959%3]) with mapi id 15.20.2157.022; Fri, 16 Aug 2019
 17:01:47 +0000
From: "StDenis, Tom" <Tom.StDenis@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amd/amdgpu: Disable GFX_PG on laptop raven part
Thread-Topic: [PATCH] drm/amd/amdgpu: Disable GFX_PG on laptop raven part
Thread-Index: AQHVVFRJMlrGqsxlKkGqrRtJ9z6zjg==
Date: Fri, 16 Aug 2019 17:01:47 +0000
Message-ID: <20190816170121.8172-1-tom.stdenis@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: PN1PR0101CA0012.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c00:e::22) To MWHPR12MB1311.namprd12.prod.outlook.com
 (2603:10b6:300:13::20)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.21.0
x-originating-ip: [165.204.159.242]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 935cad53-ea37-4564-dd6b-08d7226b6c15
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MWHPR12MB1598; 
x-ms-traffictypediagnostic: MWHPR12MB1598:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR12MB1598D7EE67D148166A5CB183F7AF0@MWHPR12MB1598.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:792;
x-forefront-prvs: 0131D22242
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(39860400002)(396003)(376002)(346002)(136003)(189003)(199004)(26005)(486006)(102836004)(14454004)(476003)(53936002)(2351001)(25786009)(8936002)(2906002)(386003)(50226002)(3846002)(86362001)(305945005)(7736002)(71200400001)(316002)(2616005)(4326008)(71190400001)(66446008)(5660300002)(6486002)(8676002)(1076003)(66476007)(99286004)(5640700003)(52116002)(6506007)(186003)(66556008)(4744005)(81156014)(6436002)(81166006)(36756003)(478600001)(2501003)(66066001)(6116002)(6512007)(64756008)(6916009)(66946007)(256004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1598;
 H:MWHPR12MB1311.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: yGuy2n+hgV6BgMUwN8xLz9hdqhr5VD0p718r2mMAAhRepEsQJDEL3GTN3aUZD9db2EsHZrbhUkxeMN8ypgDSBluztI1+4EseZaXkWIYBKU+9zXpdujEi9uMrBzqkiUlRz0Yu3IwH5PR7bAoYafUtqiEGtMQ0W7C5bj0/Pq08cllR4aWEThxB07sBYrKgrGDRsdG10F+3wvF6KSoCq2x4P1mBqjrAetKz31KcT2EtHRyU+aJ84N6tTwFFAluk0a8rFbBEtiURIrm8XKb62JPY/YUS9p3Q5QT5iLnJwiclVrnvmiuGJ2SdLid+TQfnYPZFWvtPJvc/U9KrzxB/5rEQbgn+N44HBVXs8SQxH4/FlpOAlT+ZxA5J/DJypwK7y+iQ2PEh6Gm+0IGRbldrnIbVYnkTcbCTHcNjslnMv3W1mJo=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 935cad53-ea37-4564-dd6b-08d7226b6c15
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Aug 2019 17:01:47.2798 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Nt5BvgiWyUz6fRAqCVaKw9pIj+kwC5JkPXbFJ5waKWnCv8M4A5WQ4RCXD/CbKaQpjlvx/ABuzokrpr6zDYsAKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1598
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vvnc/p/zVFS+SRj6R3vLg3APpN04IiSAbctNaTcXyv0=;
 b=wATlwbjteTLh5aPnnQS72lufUcFYEPtWMxOSGUE0jiJrO0t2jFiojqTBD53VO+yGJrZXWjQ25x61G6XaSxbPmVlityUDVnocryjqA2PPw3jYnM+qasK3RI+H7efWZLuoIooeSwa4+JLtHy0sDQZi3nJSzRkbR8n56UhbAMLTzLQ=
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

R0ZYX1BHIGNhdXNlcyB2aXN1YWwgKGFuZCBsaWtlbHkgbWVtb3J5KSBjb3JydXB0aW9uIG9uIGxh
cHRvcApyYXZlbiBwYXJ0cy4gIFVudGlsIGl0J3MgZnVsbHkgZGlhZ25vc2VkIGxldCdzIGRpc2Fi
bGUgaXQgdG8gZW5zdXJlCnN0YWJsZSBvcGVyYXRpb24uCgpUZXN0ZWQgb24gYSBEZWxsIExhdGl0
dWRlIDU0OTUuCgpTaWduZWQtb2ZmLWJ5OiBUb20gU3QgRGVuaXMgPHRvbS5zdGRlbmlzQGFtZC5j
b20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc29jMTUuYyB8IDUgKysrKysKIDEg
ZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9zb2MxNS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc29jMTUu
YwppbmRleCA3N2U2Nzk5MjBjMWMuLjI3YTUwMGY3NWY1NyAxMDA2NDQKLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvc29jMTUuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9zb2MxNS5jCkBAIC0xMTM4LDYgKzExMzgsMTEgQEAgc3RhdGljIGludCBzb2MxNV9jb21tb25f
ZWFybHlfaW5pdCh2b2lkICpoYW5kbGUpCiAJCQlhZGV2LT5wZ19mbGFncyB8PSBBTURfUEdfU1VQ
UE9SVF9HRlhfUEcgfAogCQkJCUFNRF9QR19TVVBQT1JUX0NQIHwKIAkJCQlBTURfUEdfU1VQUE9S
VF9STENfU01VX0hTOworCisJCS8vIGRpc2FibGUgR0ZYX1BHIHVudGlsIGRlYnVnZ2VkLgorCQlp
ZiAoYWRldi0+ZXh0ZXJuYWxfcmV2X2lkID09IDB4MjEpCisJCQlhZGV2LT5wZ19mbGFncyAmPSB+
QU1EX1BHX1NVUFBPUlRfR0ZYX1BHOworCiAJCWJyZWFrOwogCWNhc2UgQ0hJUF9BUkNUVVJVUzoK
IAkJYWRldi0+YXNpY19mdW5jcyA9ICZ2ZWdhMjBfYXNpY19mdW5jczsKLS0gCjIuMjEuMAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWls
aW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
