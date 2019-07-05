Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1071260055
	for <lists+amd-gfx@lfdr.de>; Fri,  5 Jul 2019 06:58:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CB296E3FC;
	Fri,  5 Jul 2019 04:58:20 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710050.outbound.protection.outlook.com [40.107.71.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B99056E3FC
 for <amd-gfx@lists.freedesktop.org>; Fri,  5 Jul 2019 04:58:17 +0000 (UTC)
Received: from MN2PR12MB3296.namprd12.prod.outlook.com (20.179.80.139) by
 MN2PR12MB3552.namprd12.prod.outlook.com (20.179.80.209) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.16; Fri, 5 Jul 2019 04:58:16 +0000
Received: from MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::154f:3d2f:d2ca:3a6e]) by MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::154f:3d2f:d2ca:3a6e%3]) with mapi id 15.20.2052.010; Fri, 5 Jul 2019
 04:58:16 +0000
From: "Wang, Kevin(Yang)" <Kevin1.Wang@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amdgpu: add mode1 (psp) reset for navi asic
Thread-Topic: [PATCH] drm/amdgpu: add mode1 (psp) reset for navi asic
Thread-Index: AQHVMu5BCQKWijjzNUyrroLP+C+4mA==
Date: Fri, 5 Jul 2019 04:58:15 +0000
Message-ID: <20190705045740.28107-1-kevin1.wang@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK0PR01CA0037.apcprd01.prod.exchangelabs.com
 (2603:1096:203:3e::25) To MN2PR12MB3296.namprd12.prod.outlook.com
 (2603:10b6:208:aa::11)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.22.0
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 15e84cda-3eff-4376-3b81-08d7010563c0
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3552; 
x-ms-traffictypediagnostic: MN2PR12MB3552:
x-microsoft-antispam-prvs: <MN2PR12MB35525AEB2FE903E21F840A70A2F50@MN2PR12MB3552.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1247;
x-forefront-prvs: 008960E8EC
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(346002)(39860400002)(396003)(136003)(366004)(199004)(189003)(54906003)(6486002)(53936002)(50226002)(6436002)(6512007)(2501003)(478600001)(3846002)(36756003)(486006)(186003)(5640700003)(66446008)(476003)(2616005)(73956011)(316002)(14454004)(66476007)(64756008)(66946007)(66556008)(5660300002)(6116002)(26005)(2351001)(305945005)(1076003)(14444005)(25786009)(71190400001)(7736002)(86362001)(66066001)(68736007)(256004)(8936002)(4326008)(6916009)(52116002)(99286004)(72206003)(71200400001)(2906002)(81156014)(102836004)(386003)(6506007)(8676002)(81166006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3552;
 H:MN2PR12MB3296.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: GgpLgFm/0A78bwjCMhxczqxoNN8xxtITfffshoOjx5OnH8ONNwVAn1kSQ72fkHHKo1AT3ULXuTqXClmdoNvAWSQvzMFKvl/fw6c0GUPmKodrmIns0qWP4uWjw5IjE6X5JEiZ2GIsiV1ERuk53qt5R8CWeXEqJffI8RHBqva0g5nNZLttLxKBuNQ7mKHhcpSPkZBUgU6W8EwgQF8px+nDQvaMDjmZlE6jWFGzCfxRCBLjL5ZLp2u+9pI1y6xWInBZr/W2pPsLZveBOhiBxAbTkjIWFkeHeoQ1nUvz/nq55p9h7rx0EzYRAJhcQXj22JQGFo+796UqwFZrYO5RcQ8aLSJI5kczX1uiiehlZo+7m37Y1ttxqzASaXh7xg4g7XjOqEWJCBPQEW/RdxQ3WJKRAAKB+8aIu3yx7qO+TCFeQkk=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15e84cda-3eff-4376-3b81-08d7010563c0
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jul 2019 04:58:15.8949 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kevwa@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3552
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EIufJWFzUr4HjyoAvq7wX2oCaFZemsHjn4CSRMR9Zvk=;
 b=FAluCbwdE6wiRyvjb4dAVqdJXkGRYCmP+w+xly5SBCLfnvVA2YzPcF0BSQDqc7PdtN2QJaXMxaoRLrrsUhs+ThvYglSR4NDoJUKKRR/489EDf5NgqgSSDqnhFbB+1E63JOz2fOA9R1FS4AUwSoNcmi0rwl9YvDbnjd7Dp4WgFa0=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Kevin1.Wang@amd.com; 
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
Cc: "Xiao, Jack" <Jack.Xiao@amd.com>, "Wang,
 Kevin\(Yang\)" <Kevin1.Wang@amd.com>,
 "Kenenth.Feng@amd.com" <Kenenth.Feng@amd.com>, "Zhang,
 Hawking" <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

YWRkIG1vZGUxIChieSBwc3ApIHJlc2V0IGZvciBuYXZpIGFzaWMuCgpDaGFuZ2UtSWQ6IElkMmU3
Y2IxMWViNzAyNjI5NmQxNDg4YzdjMzlmODk1YjEwMGYyMDZjClNpZ25lZC1vZmYtYnk6IEtldmlu
IFdhbmcgPGtldmluMS53YW5nQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvbnYuYyB8IDM1ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNo
YW5nZWQsIDM1IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9udi5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvbnYuYwppbmRleCBmNmYx
NTJlNmFkZTQuLjA1ZmQ0NzM2YmMwYyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvbnYuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9udi5jCkBAIC0yNTYs
NiArMjU2LDM5IEBAIHN0YXRpYyB2b2lkIG52X2dwdV9wY2lfY29uZmlnX3Jlc2V0KHN0cnVjdCBh
bWRncHVfZGV2aWNlICphZGV2KQogfQogI2VuZGlmCiAKK3N0YXRpYyBpbnQgbnZfYXNpY19tb2Rl
MV9yZXNldChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKK3sKKwl1MzIgaTsKKwlpbnQgcmV0
ID0gMDsKKworCWFtZGdwdV9hdG9tYmlvc19zY3JhdGNoX3JlZ3NfZW5naW5lX2h1bmcoYWRldiwg
dHJ1ZSk7CisKKwlkZXZfaW5mbyhhZGV2LT5kZXYsICJHUFUgbW9kZTEgcmVzZXRcbiIpOworCisJ
LyogZGlzYWJsZSBCTSAqLworCXBjaV9jbGVhcl9tYXN0ZXIoYWRldi0+cGRldik7CisKKwlwY2lf
c2F2ZV9zdGF0ZShhZGV2LT5wZGV2KTsKKworCXJldCA9IHBzcF9ncHVfcmVzZXQoYWRldik7CisJ
aWYgKHJldCkKKwkJZGV2X2VycihhZGV2LT5kZXYsICJHUFUgbW9kZTEgcmVzZXQgZmFpbGVkXG4i
KTsKKworCXBjaV9yZXN0b3JlX3N0YXRlKGFkZXYtPnBkZXYpOworCisJLyogd2FpdCBmb3IgYXNp
YyB0byBjb21lIG91dCBvZiByZXNldCAqLworCWZvciAoaSA9IDA7IGkgPCBhZGV2LT51c2VjX3Rp
bWVvdXQ7IGkrKykgeworCQl1MzIgbWVtc2l6ZSA9IGFkZXYtPm5iaW9fZnVuY3MtPmdldF9tZW1z
aXplKGFkZXYpOworCisJCWlmIChtZW1zaXplICE9IDB4ZmZmZmZmZmYpCisJCQlicmVhazsKKwkJ
dWRlbGF5KDEpOworCX0KKworCWFtZGdwdV9hdG9tYmlvc19zY3JhdGNoX3JlZ3NfZW5naW5lX2h1
bmcoYWRldiwgZmFsc2UpOworCisJcmV0dXJuIHJldDsKK30KIHN0YXRpYyBpbnQgbnZfYXNpY19y
ZXNldChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKIHsKIApAQCAtMjcyLDYgKzMwNSw4IEBA
IHN0YXRpYyBpbnQgbnZfYXNpY19yZXNldChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKIAog
CWlmIChzbXVfYmFjb19pc19zdXBwb3J0KHNtdSkpIHsKIAkJcmV0ID0gc211X2JhY29fcmVzZXQo
c211KTsKKwl9IGVsc2UgeworCQlyZXQgPSBudl9hc2ljX21vZGUxX3Jlc2V0KGFkZXYpOwogCX0K
IAogCXJldHVybiByZXQ7Ci0tIAoyLjIyLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vYW1kLWdmeA==
