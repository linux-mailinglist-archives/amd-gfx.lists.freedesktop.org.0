Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B92998E725
	for <lists+amd-gfx@lfdr.de>; Thu, 15 Aug 2019 10:43:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2698A6E8FD;
	Thu, 15 Aug 2019 08:43:45 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710048.outbound.protection.outlook.com [40.107.71.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A17C6E8FD
 for <amd-gfx@lists.freedesktop.org>; Thu, 15 Aug 2019 08:43:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FCOI4p9i0VyoicU8Vv5wmbB9pgAWM/mUBB3rivlIujCcMOVGjoF1BsIlGXzjeOhxIeu0qAz2BMMgqL24eVnWOznqQHJI9s3J6m44fK3bgO27dxdsWxO36mUBPEKOj9My0kC/ah8wOAMCL5hqGdggXvKauMgpACmXyjKsQTpokx24cMpbbUu949pq41Z0hoE7Foaw7T0M/0FctUcstzoBmdyJPHzz9P1zKcbuqXFlh57MNAH/QVnA3W1JVD9CBNSDCpd00u1Op9wB55DNn701wmiexiN7RMvQYXBDyiQ6sQtn+ugk40OdGlrfdKEAgQ/21CfuyctdK2KeiP8J9J0sSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W1vdCQTpcWvQN71V8NPFDPULfoIwC1q5y0wWYE9vTGA=;
 b=UtbRtwBtCAFgf30gX31WvKiGkBxAHYo8fV4mQOstxIggVKxduDLrg3V3HSyTe+B0eWw4qWdVVPTY0/RedybHq+fv7FknEstIXQksP3TyBerYX2Qt+X+BbbCddbnqeCPvvdW8YjKpGXE4xa7Bmn4Pu6g853WEGvEG2xpqE8+bTTuH6VeM6wm8vvQhRb6ob217vbjqWtw74i3Y7bWu64QBWeSnOePoX2CWFdoJWjYnGKvH1MMzw4vaVHi7IVwlFM1zgQCo9oUEb25TklQAY4ZjlqRS5eQAhw06uf+VYKIKCmyh04rR4O80nIvL2F2T2m/GREyJ7aYOpdv6Pvjkk6d/OA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BN8PR12MB3602.namprd12.prod.outlook.com (20.178.212.86) by
 BN8PR12MB3634.namprd12.prod.outlook.com (20.178.211.218) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.16; Thu, 15 Aug 2019 08:43:41 +0000
Received: from BN8PR12MB3602.namprd12.prod.outlook.com
 ([fe80::14b1:e78d:199:be00]) by BN8PR12MB3602.namprd12.prod.outlook.com
 ([fe80::14b1:e78d:199:be00%3]) with mapi id 15.20.2157.022; Thu, 15 Aug 2019
 08:43:41 +0000
From: "Yuan, Xiaojie" <Xiaojie.Yuan@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amdgpu: remove special autoload handling for navi12
Thread-Topic: [PATCH] drm/amdgpu: remove special autoload handling for navi12
Thread-Index: AQHVU0WKYwQOfjwhGk+k2TAEZVPvyg==
Date: Thu, 15 Aug 2019 08:43:41 +0000
Message-ID: <20190815084320.20015-1-xiaojie.yuan@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK2PR02CA0150.apcprd02.prod.outlook.com
 (2603:1096:202:16::34) To BN8PR12MB3602.namprd12.prod.outlook.com
 (2603:10b6:408:49::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.20.1
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8adbb809-99cd-4f24-23cd-08d7215cac82
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BN8PR12MB3634; 
x-ms-traffictypediagnostic: BN8PR12MB3634:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN8PR12MB3634F687135A21124796E71889AC0@BN8PR12MB3634.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4303;
x-forefront-prvs: 01304918F3
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(39860400002)(366004)(396003)(346002)(189003)(199004)(5660300002)(4744005)(50226002)(8676002)(81166006)(81156014)(8936002)(1076003)(6916009)(14454004)(26005)(86362001)(99286004)(186003)(54906003)(386003)(6506007)(478600001)(102836004)(52116002)(2351001)(486006)(476003)(2616005)(316002)(2501003)(25786009)(4326008)(6436002)(256004)(14444005)(5640700003)(6116002)(6512007)(2906002)(3846002)(66946007)(66476007)(66556008)(64756008)(66446008)(53936002)(6486002)(36756003)(66066001)(305945005)(7736002)(71200400001)(71190400001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR12MB3634;
 H:BN8PR12MB3602.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 36EtCGuLfeq//zL/gs/3NYme0mJiNYPHTHpAy2ZNX3+X5DKGLHKKkKMfWFqmMTZeclEn3xIbPvRDlSD2rvZAgpK3PL7XMUfh70ofgNmwhb+21/EW3TyCqGJvYQHsxafxEzl8yFyQL2/faCFDw1ESMVUIO0NJubB2fDgbM+axEcT2IUfaSh0oB75LrgsEJznRsWrw8IgKhnCJIS8w479mCHXHqhDyO1yIO4S9n58gv/OiYBmHVIdJXSHSnHI9fZKlerMvPEFNBJCBd+r9d9YQYo1UmioWRNczg4cd+DgpFoRQDEztmauhOtowZL+7dq6a7MtNltlabmBlRGWTHqzMohEWYkB4eOi8yqP5gvLW+9v3/2LxYBmk5DKvYG1FKdngmUfhfWff4q8rn87otm7r2QxlI7qSHg+hDN5aFMFp2fg=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8adbb809-99cd-4f24-23cd-08d7215cac82
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2019 08:43:41.5010 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: c6NwG+/JtUMXceFatW20cNUy4jv/aA14n5H4AqQ5CdfJ0GXx8bUQwMgivcAZroS0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3634
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W1vdCQTpcWvQN71V8NPFDPULfoIwC1q5y0wWYE9vTGA=;
 b=387TQYnzpgu4OaWYgWHxSqWJLDYO/Kc0WTz7Xox6imcEOigzD0DkR2sCWrMclgNeaeitLwUkILNUd2exrmuY0S83xUDW3DeXnkgggsR3kjFdB68o86lnF/Ot4pyfol7OcOG/TsdPV9vcdNXHVFjEdviWb/TaDe8WCdIUPYUYPM8=
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
Cc: "Xiao, Jack" <Jack.Xiao@amd.com>, "Yuan, Xiaojie" <Xiaojie.Yuan@amd.com>,
 "Zhang, Hawking" <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

cy9yIGxpc3QgaW4gcmxjIGZpcm13YXJlIGlzIHJlYWR5LCBzbyByZW1vdmUgdGhlIHNwZWNpYWwg
YXV0b2xvYWQgaGFuZGxpbmcKClNpZ25lZC1vZmYtYnk6IFhpYW9qaWUgWXVhbiA8eGlhb2ppZS55
dWFuQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3BzcC5j
IHwgMyArLS0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMiBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcHNwLmMgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcHNwLmMKaW5kZXggYWFhNGNkZjhiY2Fl
Li40YjJkMmZkNzJkYzYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9wc3AuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcHNwLmMK
QEAgLTEwMzMsOCArMTAzMyw3IEBAIHN0YXRpYyBpbnQgcHNwX25wX2Z3X2xvYWQoc3RydWN0IHBz
cF9jb250ZXh0ICpwc3ApCiAJCQlyZXR1cm4gcmV0OwogCiAJCS8qIFN0YXJ0IHJsYyBhdXRvbG9h
ZCBhZnRlciBwc3AgcmVjaWV2ZWQgYWxsIHRoZSBnZnggZmlybXdhcmUgKi8KLQkJaWYgKHVjb2Rl
LT51Y29kZV9pZCA9PSBBTURHUFVfVUNPREVfSURfUkxDX1JFU1RPUkVfTElTVF9TUk1fTUVNIHx8
Ci0JCSAgICAoYWRldi0+YXNpY190eXBlID09IENISVBfTkFWSTEyICYmIHVjb2RlLT51Y29kZV9p
ZCA9PSBBTURHUFVfVUNPREVfSURfUkxDX0cpKSB7CisJCWlmICh1Y29kZS0+dWNvZGVfaWQgPT0g
QU1ER1BVX1VDT0RFX0lEX1JMQ19SRVNUT1JFX0xJU1RfU1JNX01FTSkgewogCQkJcmV0ID0gcHNw
X3JsY19hdXRvbG9hZChwc3ApOwogCQkJaWYgKHJldCkgewogCQkJCURSTV9FUlJPUigiRmFpbGVk
IHRvIHN0YXJ0IHJsYyBhdXRvbG9hZFxuIik7Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1n
ZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
