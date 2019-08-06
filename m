Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5427182BF0
	for <lists+amd-gfx@lfdr.de>; Tue,  6 Aug 2019 08:46:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E64F689DD2;
	Tue,  6 Aug 2019 06:46:33 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750082.outbound.protection.outlook.com [40.107.75.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 199A989DCF
 for <amd-gfx@lists.freedesktop.org>; Tue,  6 Aug 2019 06:46:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UkEbRsr74WjZib+NEzFbd5qNIDmk8XA/SsERzceYM2JlaCQJy2L0viPe6iC/7m+jzoS2/ZxLEQPB70z3YiV0ZBHAwulWPqYtUgY2Jda5AqrqXToJM4Qh4wbZIHDuwhBsq0MD0OGCejn+jBIufK70VR/9Eu82zy/RNcwpOyZHKa6DgI3VsRVD4pOP6QG5VXgXk5w43tN+EiHV00cYUK+eE3BybE9t3HW30Z/TXb5IvTfZnDOVNhCQBI7or934i+Pcs6KOLs81acXDY4VKsSd6y4vi7Hbw/2P+95wpeLk7ujkU14KyUKLk8loa5Q1aNhBuCMh7r2otSttLhNxcYnZzXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v+/uUKFa26qRFYI3ifDIOob2ZcZJYFQaFR7xu3zBLjs=;
 b=nJqvULb2Q/pYP253c7MpuJ++gWekhfsMLAxdpLHZGcPdhwcREj/xO+N2z2pU6HEvYj4y5xJTCyM01hDqWUDEQWeZAVdPQVvnWnXcMX92piyR5SMLpGtXasTbR3pnJWxpdXqUagFD6R7IMl3pre31fflSakrxU9MKySWD4KKgoh5OOY93cbMriRvUU6GN1oOq/tpQ9LE/Pd1/BfLcycUuZPLtSb8EqksxlF+FubXz/3bNN3xZZY/lp1X9b0YBx06lLLM1GB+D1BzADg28nYRayEvJ72QmYKzQLWKCqZmdNSpl7i6EemG/VzmXfcVploPcl/MvQmOR8O32XwDiiBaxDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from BN8PR12MB3602.namprd12.prod.outlook.com (20.178.212.86) by
 BN8PR12MB3540.namprd12.prod.outlook.com (20.179.67.33) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.16; Tue, 6 Aug 2019 06:46:30 +0000
Received: from BN8PR12MB3602.namprd12.prod.outlook.com
 ([fe80::14b1:e78d:199:be00]) by BN8PR12MB3602.namprd12.prod.outlook.com
 ([fe80::14b1:e78d:199:be00%3]) with mapi id 15.20.2136.018; Tue, 6 Aug 2019
 06:46:30 +0000
From: "Yuan, Xiaojie" <Xiaojie.Yuan@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 04/10] drm/amdgpu: enable sdma clock gating for navi12
Thread-Topic: [PATCH 04/10] drm/amdgpu: enable sdma clock gating for navi12
Thread-Index: AQHVTCKt+/KbWvEAskW5pJXEvi/icg==
Date: Tue, 6 Aug 2019 06:46:30 +0000
Message-ID: <20190806064546.19434-5-xiaojie.yuan@amd.com>
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
x-ms-office365-filtering-correlation-id: 7af62482-78d7-4e58-96c7-08d71a39cffe
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BN8PR12MB3540; 
x-ms-traffictypediagnostic: BN8PR12MB3540:
x-microsoft-antispam-prvs: <BN8PR12MB354033042BD4EA1AD79A17B289D50@BN8PR12MB3540.namprd12.prod.outlook.com>
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
x-microsoft-antispam-message-info: cS1fbs/66ErZcsw918rdKsg7QtWxs+rHfpA7LNX3ft1YQU8ufhTICOjL5leYvFSU2n7eofj/5glMI4FMJqJ3QlS2jt/CkEPZ0YTB6TYWkMFrVy+cX5J3VHcAULsJ+Ax0Y4QOr9eyl+RG2b0aQqfTbAuHZb7OufamIwuv4USJaD4x14mEEIN2YuglfvV7bkWS4v8s9ENb75be/Re8XDxFSgE7RtxdEQwfezG8zQ0RXA0HIvj73Xdn8f2hnNi8SaXeUfFYAAMTCuaRFH5y4MlJmjqptx3WQPfvkUvTkgkK7ejIpPknz82c2Cce3rbYwZeXyjhHOnbgGV0cmcODd6ivOV2zcOunfScdFp3XkMmJI4lW9ayp0ecdtyj6YSQ7X2H8N7OsV4uMWnxY0N2kgk1LaW0rF6s4UrhqjUm8UQa/2Tw=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7af62482-78d7-4e58-96c7-08d71a39cffe
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Aug 2019 06:46:30.5328 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xiyuan@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3540
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v+/uUKFa26qRFYI3ifDIOob2ZcZJYFQaFR7xu3zBLjs=;
 b=rlKLNA30x6s9QdV17WobUd8Hd0lYq67VIOyECLAGWG16blng46MZynvvS2sX1LK9wl/B4TxIW3b/5qkaloxln5GMHQsfJQ2yhshOF+GQiZ3bt/0kkVI9Nxl2VxSQH6GEXSM8z4DGAnLcIav8bnrEWAfIA9fMMId7YLLCx3v0/Go=
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

ZW5hYmxlcyBzZG1hIG1lZGl1bSBncmFpbmVkIGNsb2NrIGdhdGluZyBhbmQgbWVtb3J5IGxpZ2h0
IHNsZWVwCgpTaWduZWQtb2ZmLWJ5OiBYaWFvamllIFl1YW4gPHhpYW9qaWUueXVhbkBhbWQuY29t
PgpSZXZpZXdlZC1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgot
LS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L252LmMgfCA0ICsrKy0KIDEgZmlsZSBjaGFu
Z2VkLCAzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9udi5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvbnYu
YwppbmRleCBjNDhiODUzYmVkY2YuLjVjOGY3YjdhYjNjNSAxMDA2NDQKLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvbnYuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9u
di5jCkBAIC01NjcsNyArNTY3LDkgQEAgc3RhdGljIGludCBudl9jb21tb25fZWFybHlfaW5pdCh2
b2lkICpoYW5kbGUpCiAJCQlBTURfQ0dfU1VQUE9SVF9HRlhfQ1BfTFMgfAogCQkJQU1EX0NHX1NV
UFBPUlRfR0ZYX1JMQ19MUyB8CiAJCQlBTURfQ0dfU1VQUE9SVF9IRFBfTUdDRyB8Ci0JCQlBTURf
Q0dfU1VQUE9SVF9IRFBfTFM7CisJCQlBTURfQ0dfU1VQUE9SVF9IRFBfTFMgfAorCQkJQU1EX0NH
X1NVUFBPUlRfU0RNQV9NR0NHIHwKKwkJCUFNRF9DR19TVVBQT1JUX1NETUFfTFM7CiAJCWFkZXYt
PnBnX2ZsYWdzID0gQU1EX1BHX1NVUFBPUlRfVkNOX0RQRzsKIAkJYWRldi0+ZXh0ZXJuYWxfcmV2
X2lkID0gYWRldi0+cmV2X2lkICsgMHhhOwogCQlicmVhazsKLS0gCjIuMjAuMQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxp
c3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
