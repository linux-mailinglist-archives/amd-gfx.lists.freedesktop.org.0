Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C6CA0AF9A0
	for <lists+amd-gfx@lfdr.de>; Wed, 11 Sep 2019 11:56:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5999E6E20D;
	Wed, 11 Sep 2019 09:56:37 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730085.outbound.protection.outlook.com [40.107.73.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A09CA6E20D
 for <amd-gfx@lists.freedesktop.org>; Wed, 11 Sep 2019 09:56:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TxZbdmtt4yCQL2Va0wnGnky0bwD4cxlOO/jeOP4RpbyUl2VGAQ9FX/N9zqMCZxjNDziTGOGegv3kEfneBhViQ8t56RR9Jr1pciWmvoRIXTO8jppYkuhbVu3dbDraHzby9OyLCddoxIT8G/eH9EmmPcu0lZEsh6EUSuyjapsYy6swZLeT7HuStrXlA+a5VFoiDDMVoHrIKJyAvJeJxyKyj2yi6BfMmIfWigkzlxvUt8IUeWdqUWp51XeqtOwlSSAG1v6/1QEeUrtvSC1RAM6Ehsw+9wZxf/Sb2kO04wIDpp/eH9UkZ1eq+GqhF2Vj77Onboh/4m9+fCrPJNSdD1B4PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rSMt8PSz3kxgyC/wP4B2u6YmILhQ4j5SivGoibZmBXU=;
 b=epI4QNA6q6a4fp1cPxdVAugh5EBboFM3viGHEvBzbb+FyCURnQPH6/MzfgXLTzd451EE1UnrohmFkSypCqItaCEDwvUFq1dB0/tWVIzlCF0c/BIdi87Cme760cqhknOJq1gpMj0U5/Lbgg97na+jchATT6fbImeYAKFJDbVro6eV3c5QR1WwE8uu6CV6gqJy+A5umpO2bVWbCrOL77RvfWBP3VZ8xJeqUV/l0AjFBff7U1M7AYKPOVGm/trn5izXlxEBa4eFfsLkMfJAb+yClfIIWsEg9dCuFRbsgEoNLuKGLcD2zQvz5iS2WJ55j6e8Ag2ojH5MuWp6/TqqaTyhiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BN8PR12MB3602.namprd12.prod.outlook.com (20.178.212.86) by
 BN8PR12MB3412.namprd12.prod.outlook.com (20.178.209.85) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.14; Wed, 11 Sep 2019 09:56:29 +0000
Received: from BN8PR12MB3602.namprd12.prod.outlook.com
 ([fe80::55d8:90a7:d1dc:e9e3]) by BN8PR12MB3602.namprd12.prod.outlook.com
 ([fe80::55d8:90a7:d1dc:e9e3%7]) with mapi id 15.20.2241.018; Wed, 11 Sep 2019
 09:56:29 +0000
From: "Yuan, Xiaojie" <Xiaojie.Yuan@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amdgpu: get gpu info from ip discovery table
Thread-Topic: [PATCH] drm/amdgpu: get gpu info from ip discovery table
Thread-Index: AQHVaIcu1GyCtBzBNkGRUiL80QK6Kw==
Date: Wed, 11 Sep 2019 09:56:29 +0000
Message-ID: <20190911095615.12055-1-xiaojie.yuan@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK2PR02CA0138.apcprd02.prod.outlook.com
 (2603:1096:202:16::22) To BN8PR12MB3602.namprd12.prod.outlook.com
 (2603:10b6:408:49::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.20.1
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: af494387-e688-43ba-21e9-08d7369e50fe
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BN8PR12MB3412; 
x-ms-traffictypediagnostic: BN8PR12MB3412:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN8PR12MB3412186311DC21A02899D87A89B10@BN8PR12MB3412.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-forefront-prvs: 0157DEB61B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(346002)(39860400002)(396003)(136003)(366004)(189003)(199004)(5660300002)(66946007)(86362001)(66066001)(66476007)(66556008)(64756008)(66446008)(50226002)(2501003)(81156014)(81166006)(8676002)(8936002)(7736002)(305945005)(1076003)(2906002)(36756003)(6916009)(71190400001)(71200400001)(3846002)(6116002)(386003)(4326008)(6506007)(316002)(99286004)(25786009)(5640700003)(6512007)(54906003)(14454004)(53936002)(6436002)(478600001)(102836004)(186003)(476003)(2351001)(486006)(2616005)(26005)(52116002)(256004)(6486002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR12MB3412;
 H:BN8PR12MB3602.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: GkCdCH+Zq5EjoicPEQY0iqM/SzHot/V+OmTq65Po9tqBka/6sV8OBKlM91EqLQ1Er17i7lLxJZ89ZwTozfcmobPvQnlo8dY2DaIOWLrhsZROJhCZ70dpw26u3OHa/jOJ20B1qz8EWnwv7VypXzD6WW50DfJSZ04WpYpV8XAMSCCqzmvdUqXa/wN9HH9b7h4TGEtq9XIdihEhun78id7q/jErfaVfZ26hLhJOdTPts+59e3SBXI7+kcDPQ4jkg+o8IEKz2RK1HArI85lNlIBgLx/dxp+GvmjvmZq9z6Jt2rju6NLWOHzLjaqdn4OSp1HMXMT5h+55mvtOUiHcdSbtZOAa5+rmCUx/jIvSJXKRGwZhR8fzW66bqUHkPkHbkb/Qqso4dxWhcinCg0L2T5aOHmWfPgynA6EshfwbMMXklFM=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af494387-e688-43ba-21e9-08d7369e50fe
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2019 09:56:29.0147 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GOHa0oA0pphaMgN96b77lVwJPws5yoa15MpSlz5kAcMB/1DCOPDX7YUGhaAdPoeE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3412
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rSMt8PSz3kxgyC/wP4B2u6YmILhQ4j5SivGoibZmBXU=;
 b=he9AR3W9264Ygp+BEAvw2uVG3S5SNULU9BCkbAS6nPzg9wvejIBkevLa+k7QPF1R29+6nTCRunXID25oK0+3A5yZONixmBI3RTSsxjQCwBQRPdi+1fB/jRhYetItlVIl9O4lrqF7OiAAcuWCdBYiDqYOQOINL3s0G5yg9jq6VVA=
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
Cc: "Xiao, Jack" <Jack.Xiao@amd.com>, "Yin,
 Tianci \(Rico\)" <Tianci.Yin@amd.com>, "Yuan, 
 Xiaojie" <Xiaojie.Yuan@amd.com>, "Zhang, Hawking" <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

ZXhjZXB0IHNvY19ib3VuZGluZ19ib3ggd2hpY2ggaXMgbm90IGludGVncmF0ZWQgaW4gZGlzY292
ZXJ5IHRhYmxlIHlldAoKU2lnbmVkLW9mZi1ieTogWGlhb2ppZSBZdWFuIDx4aWFvamllLnl1YW5A
YW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMg
fCAxMiArKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspCgpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jCmluZGV4IDEzYmQ2YTZiZDhh
YS4uNzBlMGYyNGQzN2E4IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfZGV2aWNlLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rl
dmljZS5jCkBAIC0xNDc0LDYgKzE0NzQsOSBAQCBzdGF0aWMgaW50IGFtZGdwdV9kZXZpY2VfcGFy
c2VfZ3B1X2luZm9fZncoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCiAJCQkoY29uc3Qgc3Ry
dWN0IGdwdV9pbmZvX2Zpcm13YXJlX3YxXzAgKikoYWRldi0+ZmlybXdhcmUuZ3B1X2luZm9fZnct
PmRhdGEgKwogCQkJCQkJCQlsZTMyX3RvX2NwdShoZHItPmhlYWRlci51Y29kZV9hcnJheV9vZmZz
ZXRfYnl0ZXMpKTsKIAorCQlpZiAoYW1kZ3B1X2Rpc2NvdmVyeSAmJiBhZGV2LT5hc2ljX3R5cGUg
Pj0gQ0hJUF9OQVZJMTApCisJCQlnb3RvIHBhcnNlX3NvY19ib3VuZGluZ19ib3g7CisKIAkJYWRl
di0+Z2Z4LmNvbmZpZy5tYXhfc2hhZGVyX2VuZ2luZXMgPSBsZTMyX3RvX2NwdShncHVfaW5mb19m
dy0+Z2NfbnVtX3NlKTsKIAkJYWRldi0+Z2Z4LmNvbmZpZy5tYXhfY3VfcGVyX3NoID0gbGUzMl90
b19jcHUoZ3B1X2luZm9fZnctPmdjX251bV9jdV9wZXJfc2gpOwogCQlhZGV2LT5nZnguY29uZmln
Lm1heF9zaF9wZXJfc2UgPSBsZTMyX3RvX2NwdShncHVfaW5mb19mdy0+Z2NfbnVtX3NoX3Blcl9z
ZSk7CkBAIC0xNTAxLDcgKzE1MDQsMTMgQEAgc3RhdGljIGludCBhbWRncHVfZGV2aWNlX3BhcnNl
X2dwdV9pbmZvX2Z3KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQogCQkJYWRldi0+Z2Z4LmNv
bmZpZy5udW1fcGFja2VyX3Blcl9zYyA9CiAJCQkJbGUzMl90b19jcHUoZ3B1X2luZm9fZnctPm51
bV9wYWNrZXJfcGVyX3NjKTsKIAkJfQorCitwYXJzZV9zb2NfYm91bmRpbmdfYm94OgogI2lmZGVm
IENPTkZJR19EUk1fQU1EX0RDX0RDTjJfMAorCQkvKgorCQkgKiBzb2MgYm91bmRpbmcgYm94IGlu
Zm8gaXMgbm90IGludGVncmF0ZWQgaW4gZGlzb2NvdmVyeSB0YWJsZSwKKwkJICogd2UgYWx3YXlz
IG5lZWQgdG8gcGFyc2UgaXQgZnJvbSBncHUgaW5mbyBmaXJtd2FyZS4KKwkJICovCiAJCWlmICho
ZHItPnZlcnNpb25fbWlub3IgPT0gMikgewogCQkJY29uc3Qgc3RydWN0IGdwdV9pbmZvX2Zpcm13
YXJlX3YxXzIgKmdwdV9pbmZvX2Z3ID0KIAkJCQkoY29uc3Qgc3RydWN0IGdwdV9pbmZvX2Zpcm13
YXJlX3YxXzIgKikoYWRldi0+ZmlybXdhcmUuZ3B1X2luZm9fZnctPmRhdGEgKwpAQCAtMTYxOCw2
ICsxNjI3LDkgQEAgc3RhdGljIGludCBhbWRncHVfZGV2aWNlX2lwX2Vhcmx5X2luaXQoc3RydWN0
IGFtZGdwdV9kZXZpY2UgKmFkZXYpCiAJaWYgKHIpCiAJCXJldHVybiByOwogCisJaWYgKGFtZGdw
dV9kaXNjb3ZlcnkgJiYgYWRldi0+YXNpY190eXBlID49IENISVBfTkFWSTEwKQorCQlhbWRncHVf
ZGlzY292ZXJ5X2dldF9nZnhfaW5mbyhhZGV2KTsKKwogCWFtZGdwdV9hbWRrZmRfZGV2aWNlX3By
b2JlKGFkZXYpOwogCiAJaWYgKGFtZGdwdV9zcmlvdl92ZihhZGV2KSkgewotLSAKMi4yMC4xCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1h
aWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
