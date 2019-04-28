Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87B8DB5A5
	for <lists+amd-gfx@lfdr.de>; Sun, 28 Apr 2019 09:44:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F2F68926E;
	Sun, 28 Apr 2019 07:44:24 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810043.outbound.protection.outlook.com [40.107.81.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBBA2891BF
 for <amd-gfx@lists.freedesktop.org>; Sun, 28 Apr 2019 07:44:21 +0000 (UTC)
Received: from BYAPR12MB3176.namprd12.prod.outlook.com (20.179.92.82) by
 BYAPR12MB2933.namprd12.prod.outlook.com (20.179.91.202) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1835.12; Sun, 28 Apr 2019 07:44:20 +0000
Received: from BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::9118:73f2:809c:22c7]) by BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::9118:73f2:809c:22c7%4]) with mapi id 15.20.1835.010; Sun, 28 Apr 2019
 07:44:20 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 25/27] drm/amdkfd: Add domain number into gpu_id
Thread-Topic: [PATCH 25/27] drm/amdkfd: Add domain number into gpu_id
Thread-Index: AQHU/ZYwMWh5FKCFxkqQByKeL8k0hg==
Date: Sun, 28 Apr 2019 07:44:20 +0000
Message-ID: <20190428074331.30107-26-Felix.Kuehling@amd.com>
References: <20190428074331.30107-1-Felix.Kuehling@amd.com>
In-Reply-To: <20190428074331.30107-1-Felix.Kuehling@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
x-mailer: git-send-email 2.17.1
x-clientproxiedby: YTXPR0101CA0015.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::28) To BYAPR12MB3176.namprd12.prod.outlook.com
 (2603:10b6:a03:133::18)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d75651fa-92fe-4906-08e5-08d6cbad5339
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:BYAPR12MB2933; 
x-ms-traffictypediagnostic: BYAPR12MB2933:
x-microsoft-antispam-prvs: <BYAPR12MB29335B7A5BBCCE2BC826092092380@BYAPR12MB2933.namprd12.prod.outlook.com>
x-forefront-prvs: 0021920B5A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(396003)(136003)(346002)(376002)(366004)(199004)(189003)(50226002)(81156014)(76176011)(54906003)(6512007)(4326008)(81166006)(8676002)(2616005)(3846002)(97736004)(186003)(8936002)(6116002)(6506007)(86362001)(36756003)(305945005)(6486002)(6436002)(7736002)(386003)(5640700003)(14444005)(25786009)(11346002)(26005)(6916009)(1076003)(99286004)(256004)(5660300002)(2351001)(486006)(52116002)(2906002)(73956011)(71200400001)(2501003)(14454004)(53936002)(71190400001)(66476007)(66556008)(68736007)(66066001)(476003)(316002)(72206003)(102836004)(478600001)(64756008)(66946007)(66446008)(446003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB2933;
 H:BYAPR12MB3176.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: oBu0qJy7Ql8Ryic7kvPD0VTUahb9YYcEC+ZmfhjzuIXUo0tVm864GNqY9TVoSeZxJCMg75Yw1z0IZggnsr/dwpHLJQqvFEmcW9EKWRMMrjV7BPBTDjb1sE2PrLAX2iO8IiTdgAIJcSvM4ICJlwqs7AV3uGbAAZvgNG6YLoYX5FUJxsyCgqFiKDoZXJZXlYbM/6A70TXhPnYYQLgQpA06M1goRqvInGvFsr/G8JEmvrQvhw3VvZ+lo6m5WP3U512LR32FyXxxcEg8H+QbfLMA37oTlF2yJkJeE4W7ZvcNtm3bzIu9aLbc5RQ/aRiIvCGprJLuzMFOaeXGmoqB+j/SjefZxRFGSM/k2+BA6z0UqkIyURuWSaRkbiNflTotcwpony7KOEpVcUjTzPo64ateb2K58W87VQ4EMgoxzONSVMY=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d75651fa-92fe-4906-08e5-08d6cbad5339
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Apr 2019 07:44:20.8683 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2933
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FJbkI04FxZb1ezdLeMrTqgOqe8tyROCYKHwXVC0WN1A=;
 b=rlGizBD2UNrDqIsfPISD6EKyESqSLg2+0Lz0sfnr7+gK7mFv2OFzx6z6JANNocNlzGIxINP2tRzkSfkTg9hC08VCQB5AgMj66+r8Oa2lKFuA0HAMt2cH/OgRM85hWyfhUgNi/EkmkOmbl6NMKuK4V00mM9JhCr/CxQh6h59us4E=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Felix.Kuehling@amd.com; 
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
Cc: "Lin, Amber" <Amber.Lin@amd.com>, "Kuehling,
 Felix" <Felix.Kuehling@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogQW1iZXIgTGluIDxBbWJlci5MaW5AYW1kLmNvbT4NCg0KQSBtdWx0aS1zb2NrZXQgc2Vy
dmVyIGNhbiBoYXZlIG11bHRpcGxlIFBDSWUgc2VnbWVudHMgc28gQkZEIGlzIG5vdCBlbm91Z2gN
CnRvIGRpc3Rpbmd1c2ggZWFjaCBHUFUuIEFsc28gYWRkIGRvbWFpbiBudW1iZXIgaW50byBhY2Nv
dW50IHdoZW4gZ2VuZXJhdGluZw0KZ3B1X2lkLg0KDQpTaWduZWQtb2ZmLWJ5OiBBbWJlciBMaW4g
PEFtYmVyLkxpbkBhbWQuY29tPg0KUmV2aWV3ZWQtYnk6IEZlbGl4IEt1ZWhsaW5nIDxGZWxpeC5L
dWVobGluZ0BhbWQuY29tPg0KU2lnbmVkLW9mZi1ieTogRmVsaXggS3VlaGxpbmcgPEZlbGl4Lkt1
ZWhsaW5nQGFtZC5jb20+DQotLS0NCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfdG9w
b2xvZ3kuYyB8IDUgKysrLS0NCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAyIGRl
bGV0aW9ucygtKQ0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2Zk
X3RvcG9sb2d5LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfdG9wb2xvZ3kuYw0K
aW5kZXggNjQwOTlhODQ5NGUxLi4yYzA2ZDZjMTZlYWIgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGtmZC9rZmRfdG9wb2xvZ3kuYw0KKysrIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRrZmQva2ZkX3RvcG9sb2d5LmMNCkBAIC0xMDgyLDggKzEwODIsOSBAQCBzdGF0aWMgdWlu
dDMyX3Qga2ZkX2dlbmVyYXRlX2dwdV9pZChzdHJ1Y3Qga2ZkX2RldiAqZ3B1KQ0KIAkJCWxvY2Fs
X21lbV9pbmZvLmxvY2FsX21lbV9zaXplX3B1YmxpYzsNCiANCiAJYnVmWzBdID0gZ3B1LT5wZGV2
LT5kZXZmbjsNCi0JYnVmWzFdID0gZ3B1LT5wZGV2LT5zdWJzeXN0ZW1fdmVuZG9yOw0KLQlidWZb
Ml0gPSBncHUtPnBkZXYtPnN1YnN5c3RlbV9kZXZpY2U7DQorCWJ1ZlsxXSA9IGdwdS0+cGRldi0+
c3Vic3lzdGVtX3ZlbmRvciB8DQorCQkoZ3B1LT5wZGV2LT5zdWJzeXN0ZW1fZGV2aWNlIDw8IDE2
KTsNCisJYnVmWzJdID0gcGNpX2RvbWFpbl9ucihncHUtPnBkZXYtPmJ1cyk7DQogCWJ1ZlszXSA9
IGdwdS0+cGRldi0+ZGV2aWNlOw0KIAlidWZbNF0gPSBncHUtPnBkZXYtPmJ1cy0+bnVtYmVyOw0K
IAlidWZbNV0gPSBsb3dlcl8zMl9iaXRzKGxvY2FsX21lbV9zaXplKTsNCi0tIA0KMi4xNy4xDQoN
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZngg
bWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
