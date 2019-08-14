Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87F328D6CC
	for <lists+amd-gfx@lfdr.de>; Wed, 14 Aug 2019 17:01:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03E606E607;
	Wed, 14 Aug 2019 15:01:49 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690078.outbound.protection.outlook.com [40.107.69.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B6176E607
 for <amd-gfx@lists.freedesktop.org>; Wed, 14 Aug 2019 15:01:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e4LQZOV+aISF1zeUdiFwPm6ibL38Hzu9Wd/THlo4M01kgatiZtHaeSeg0SkGN+MPcZ0MsUU2YyJw8FJpzuZnYdxwSllU8p3d5+l3nDxUbQuiyky/qb0EJUyY0eobei5Oo/EEtlF65v7OdbxEnho/IMKgRvTOVyyiGm2k2CbwE3j0e/2Xxi/HFTMn1VwBRLkSiQtVyKj6Ycrg6PHysvZOgJnuQHnj+c0UozwvMPLolwoQmAYllYeaIlcpgwDaZFHYWOFJi9wNTk1J2vH7QoxH05RrskBbMF7pkfInn0GrVfeuXxiF6EPqv7al/bg9fkUxGfMmO04XjKe5sD+PJpRjXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5wZlZOBN3bc/pgkihlJpURA6onCmqWQepWPYAJTebwA=;
 b=LLnujT4k9A6YVzslq5t67fzttMhMDVPGCr/T9+IveG/utznWVpFmvtE3Sj/qcP/T3ddHkQ7XIIO1SQVkx/GJthJOQcHo7ZW5rnJE4t/Dyzm8N9czf78PUgKVAGY+nBG7+KbX6c4LN/q0/oCuiVwa93dVAQHoFfoa6VMeJTAQW48u9Y7qEHoZqq56jHxgGU7tBt4ZtDQuQwi+GfTvt4HKK/Dg85ExPbMf/850bFO2wpk+Ay/Y2daBSpvF4BITmjNVgzzvsDz8rFfpWFsQHE1MzCPb62AyNioudrKTiX8yBOiAo9TctdwaB9fRTb98xINkHv/t4FhdQY1jJdctD1zvEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BN6PR12MB1204.namprd12.prod.outlook.com (10.168.226.144) by
 BN6PR12MB1233.namprd12.prod.outlook.com (10.168.227.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.18; Wed, 14 Aug 2019 15:01:45 +0000
Received: from BN6PR12MB1204.namprd12.prod.outlook.com
 ([fe80::cd59:2af9:942:9481]) by BN6PR12MB1204.namprd12.prod.outlook.com
 ([fe80::cd59:2af9:942:9481%10]) with mapi id 15.20.2157.022; Wed, 14 Aug 2019
 15:01:45 +0000
From: Gang Ba <gaba@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] Update VM function point when VM state changed.
Thread-Topic: [PATCH] Update VM function point when VM state changed.
Thread-Index: AQHVUrEwRaNojQYwakGNCbMz8tsfig==
Date: Wed, 14 Aug 2019 15:01:45 +0000
Message-ID: <1565794853-25275-1-git-send-email-gaba@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YT1PR01CA0014.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::27)
 To BN6PR12MB1204.namprd12.prod.outlook.com
 (2603:10b6:404:1b::16)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.7.4
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2c148108-2cc0-44b7-daf5-08d720c852b7
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BN6PR12MB1233; 
x-ms-traffictypediagnostic: BN6PR12MB1233:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN6PR12MB12337D749B7AC524B3E6B6AFFFAD0@BN6PR12MB1233.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1443;
x-forefront-prvs: 01294F875B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(376002)(136003)(396003)(366004)(346002)(189003)(199004)(81166006)(52116002)(81156014)(53936002)(102836004)(2351001)(2501003)(36756003)(5640700003)(66946007)(8676002)(386003)(6506007)(6116002)(50226002)(15650500001)(3846002)(2906002)(186003)(26005)(2616005)(476003)(8936002)(486006)(14454004)(4744005)(66066001)(5660300002)(305945005)(71190400001)(71200400001)(4326008)(7736002)(66446008)(25786009)(256004)(14444005)(6512007)(66476007)(99286004)(66556008)(316002)(6916009)(478600001)(64756008)(6486002)(6436002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1233;
 H:BN6PR12MB1204.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 46s2qSIH+WbF6W46x9PTEWZJEp1YHG+Tl+cT+bPNE91yCHYK6cPsDt/GSAVAwwRHET4Qt2JV8tPgtKZbhjoXtESdfvFj8CD64eCG0QUPm4WpkQiR9OjY4np21bYQTFToEkOI9rfKtwI9RRexfMKduQrzJ/v96pFTen31g358mu5caPbjNFz7ZT69IXraYHYT76+1YRzlT7kA8muyE36ZiXAMLGADWFskg7z7sg78A/Le1AQXxAwn9yTnPZJtxKSlWPOfeoIntNBRQLOBvPnwzyW3ClMNESvO70fmyxvUXsOb5deXuAf/eaCa0Y4hbBSZTRqn+PUolRp2dNoISbWJ3VS+KQLPb9O3ak49ySSoC0KYOggWEVwBKEp8qoc1efOMwOaScnCDSVfOxwgN3YET+DzMCHboXqZIc47MxU9eA7U=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c148108-2cc0-44b7-daf5-08d720c852b7
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Aug 2019 15:01:45.2272 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: I81qc/CdLQAtQY14+oUvZN0q7cC0TATYhwP67IrvgxY8K0tqE3D0q75QDaC/3n9n
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1233
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5wZlZOBN3bc/pgkihlJpURA6onCmqWQepWPYAJTebwA=;
 b=dk0NIHPw5CtdkC4B4MVQna8czxtzOqnTY+Ba/eBQUrbCoC/8g8SiR4zYmNXszB8Kd0oQScmypk5e6LHJxLDISJObHlBVFOfWGX+mh0Fl8iIA8pec5+9Qo774mMFXrFdLvNKxmfuaSl/NPx5tSPFVbBoL8vQQo/8HrOaXcyV2qZ0=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Gang.Ba@amd.com; 
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
Cc: "Ba, Gang" <Gang.Ba@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Q2hhbmdlLUlkOiBJYmNmYWRhNTYwYTAwYzlhZWViZmQ5MjJhZTQ4ZGU5MjBlNDRhNTg2NgpTaWdu
ZWQtb2ZmLWJ5OiBHYW5nIEJhIDxnYWJhQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X3ZtLmMgfCA2ICsrKysrKwogMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0
aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92
bS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZtLmMKaW5kZXggYzFiYWYz
ZC4uNzJkZDQzNCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X3ZtLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZtLmMKQEAgLTI4
NjIsNiArMjg2MiwxMiBAQCBpbnQgYW1kZ3B1X3ZtX21ha2VfY29tcHV0ZShzdHJ1Y3QgYW1kZ3B1
X2RldmljZSAqYWRldiwgc3RydWN0IGFtZGdwdV92bSAqdm0sIHVucwogCVdBUk5fT05DRSgodm0t
PnVzZV9jcHVfZm9yX3VwZGF0ZSAmJiAhYW1kZ3B1X2dtY192cmFtX2Z1bGxfdmlzaWJsZSgmYWRl
di0+Z21jKSksCiAJCSAgIkNQVSB1cGRhdGUgb2YgVk0gcmVjb21tZW5kZWQgb25seSBmb3IgbGFy
Z2UgQkFSIHN5c3RlbVxuIik7CiAKKwlpZiAodm0tPnVzZV9jcHVfZm9yX3VwZGF0ZSkKKwkJdm0t
PnVwZGF0ZV9mdW5jcyA9ICZhbWRncHVfdm1fY3B1X2Z1bmNzOworCWVsc2UKKwkJdm0tPnVwZGF0
ZV9mdW5jcyA9ICZhbWRncHVfdm1fc2RtYV9mdW5jczsKKwl2bS0+bGFzdF91cGRhdGUgPSBOVUxM
OworCiAJaWYgKHZtLT5wYXNpZCkgewogCQl1bnNpZ25lZCBsb25nIGZsYWdzOwogCi0tIAoyLjcu
NAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdm
eCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
