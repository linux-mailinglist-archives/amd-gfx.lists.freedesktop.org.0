Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EE2E82BF1
	for <lists+amd-gfx@lfdr.de>; Tue,  6 Aug 2019 08:46:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0B5F89DFE;
	Tue,  6 Aug 2019 06:46:35 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750041.outbound.protection.outlook.com [40.107.75.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79EF589DFE
 for <amd-gfx@lists.freedesktop.org>; Tue,  6 Aug 2019 06:46:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JMLncNaoze8Ovein7yMy5arDmC631h8ARtuDPxo5fk2rzHrMcPrkzc6AYDo7powHJrfbhJmTvymZi7jKbuCTOChQtmqQdJkyn692Zi2bBTR6ImEn8q81GoMHf0QKqCkzNxYZn2lKzYl7yzWKnzNJq2Ve1PW0H3xDEuGlOkNPmD/vjyL40JrzBqmYhZr9s7Zix6v7BSe5DDjBSVo1VVfG+RDMw7bgoOcbA7q3NM1TjoYzKDPCtWIPiAVwotE/SjP5aOw9HN6cUvq2uAXW4R8z0bPlOPWmrISiAVO8GM8VotCrm4wdii4Miah9S/uCwIkJK2ocEW+bh/TgUEI/f4m3bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ng6/kAnQwqdcWCQOMlmpvLfj8rD2KVaEtno5mg42jwg=;
 b=SgNxdKPURkPz4I6UKwbRf9PUsswJOhyEhXGePNhrECN5z9TjsKOJqxLAr7D8W+xYUaX/Hrc5PkK2lBnvvHV2fNg0gTjc2/yCyFASE3L+IS3sm3iuVyKFfdOlXe6iLa8JCYjDG3AxRBLqm4u+BRrU0upiajT/BfW2p5TU9mVyFT0Ik0vU4h9LSYBXTtKeaxeTR+w1PQKzjaWQRswndOVBr9YaluomASAj0zjrST0m73aSXWW1Wz3x6kihJ+62C7VxqknUMVlZrPQ3FDHThSFgpCh/5dbpPxuX2o1kPwj6A35yizFzY409wooJzzvBxPeo32K/yhVK06B2HEnHj6IplQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from BN8PR12MB3602.namprd12.prod.outlook.com (20.178.212.86) by
 BN8PR12MB3540.namprd12.prod.outlook.com (20.179.67.33) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.16; Tue, 6 Aug 2019 06:46:33 +0000
Received: from BN8PR12MB3602.namprd12.prod.outlook.com
 ([fe80::14b1:e78d:199:be00]) by BN8PR12MB3602.namprd12.prod.outlook.com
 ([fe80::14b1:e78d:199:be00%3]) with mapi id 15.20.2136.018; Tue, 6 Aug 2019
 06:46:33 +0000
From: "Yuan, Xiaojie" <Xiaojie.Yuan@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 05/10] drm/amdgpu/mmhub2: set clock gating for navi12
Thread-Topic: [PATCH 05/10] drm/amdgpu/mmhub2: set clock gating for navi12
Thread-Index: AQHVTCKv6rLsC6EMAEWBjob2uCy3Pg==
Date: Tue, 6 Aug 2019 06:46:32 +0000
Message-ID: <20190806064546.19434-6-xiaojie.yuan@amd.com>
References: <20190806064546.19434-1-xiaojie.yuan@amd.com>
In-Reply-To: <20190806064546.19434-1-xiaojie.yuan@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK0P153CA0001.APCP153.PROD.OUTLOOK.COM
 (2603:1096:203:18::13) To BN8PR12MB3602.namprd12.prod.outlook.com
 (2603:10b6:408:49::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.20.1
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2eadc5d8-22fc-4c3a-76c6-08d71a39d14f
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BN8PR12MB3540; 
x-ms-traffictypediagnostic: BN8PR12MB3540:
x-microsoft-antispam-prvs: <BN8PR12MB3540802BFFAFDB0BE502078F89D50@BN8PR12MB3540.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:296;
x-forefront-prvs: 0121F24F22
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(396003)(39860400002)(366004)(346002)(136003)(189003)(199004)(5660300002)(50226002)(8676002)(71190400001)(71200400001)(8936002)(6512007)(81166006)(6916009)(86362001)(25786009)(53936002)(316002)(4326008)(81156014)(54906003)(446003)(26005)(76176011)(11346002)(2616005)(68736007)(14444005)(66066001)(2501003)(102836004)(186003)(3846002)(99286004)(52116002)(6506007)(2351001)(256004)(486006)(1076003)(14454004)(36756003)(476003)(66476007)(305945005)(5640700003)(386003)(478600001)(6486002)(64756008)(66446008)(66556008)(6116002)(2906002)(4744005)(66946007)(6436002)(7736002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR12MB3540;
 H:BN8PR12MB3602.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: LQmW1QIWDWweVrtm6a0ZNIVcjp2zHp12O7/6XpZi025ktAG5zCcaoFCQm4JgxTIn2xhQ2KApv8z4Pb026hrtgAa1sFcmK+5wxd6Wo0NYHNarpg4dcPdjsLk+KB8LKTO7vVFnzYebeJWGxnTF5VgidMfZIRpZusCQAsEt5slUhP3iuFa2NpkrfXuQcvv8pj/5fKJRmt+KzSjlwAGOI7kyLy1/0IiVw20EIPB/9FqS+KfO3RoT7r+ggzulV0LzghSPYWGPq+697hd0n8piVhXhreT/RQKv0tIUhEk6kcyIDe8P5nTqcVJ78KpTqfrz11v5untvAvb3xcCgGhbtqYHU2ERonoHAYYIxZzhXMRSj8hD7INdHffQsSXMuKA+OW7q9kQSo2aVcfyUxpxFxuso4NW+mupf88cU5xrkP9NaMaoo=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2eadc5d8-22fc-4c3a-76c6-08d71a39d14f
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Aug 2019 06:46:32.9704 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xiyuan@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3540
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ng6/kAnQwqdcWCQOMlmpvLfj8rD2KVaEtno5mg42jwg=;
 b=D7ERai8t4NNDddrJZHNp+qcVP2pw+EDn0yUnMZWMckUcVOjr5Uq+ChjjmOvFtAjRdG7r8jUid+3bKCvUY2x60cDoFPQjVxk1y2OwhTQGNhkInp0c2ZwomWN9gsbYwU3aseNT4JVa//8JIAi+Vz1czHbOqYNFHTnYS+Sc0loVxTU=
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Yuan,
 Xiaojie" <Xiaojie.Yuan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

YWRkIG5hdmkxMiBkZWZpbmUKClNpZ25lZC1vZmYtYnk6IFhpYW9qaWUgWXVhbiA8eGlhb2ppZS55
dWFuQGFtZC5jb20+ClJldmlld2VkLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVy
QGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvbW1odWJfdjJfMC5jIHwg
MSArCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9tbWh1Yl92Ml8wLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9tbWh1Yl92Ml8wLmMKaW5kZXggOWQ4YWNiNGMyZTIyLi5iZWVmNTFjMzc0NmYgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L21taHViX3YyXzAuYworKysgYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9tbWh1Yl92Ml8wLmMKQEAgLTQyMSw2ICs0MjEsNyBAQCBp
bnQgbW1odWJfdjJfMF9zZXRfY2xvY2tnYXRpbmcoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYs
CiAKIAlzd2l0Y2ggKGFkZXYtPmFzaWNfdHlwZSkgewogCWNhc2UgQ0hJUF9OQVZJMTA6CisJY2Fz
ZSBDSElQX05BVkkxMjoKIAkJbW1odWJfdjJfMF91cGRhdGVfbWVkaXVtX2dyYWluX2Nsb2NrX2dh
dGluZyhhZGV2LAogCQkJCXN0YXRlID09IEFNRF9DR19TVEFURV9HQVRFID8gdHJ1ZSA6IGZhbHNl
KTsKIAkJbW1odWJfdjJfMF91cGRhdGVfbWVkaXVtX2dyYWluX2xpZ2h0X3NsZWVwKGFkZXYsCi0t
IAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
