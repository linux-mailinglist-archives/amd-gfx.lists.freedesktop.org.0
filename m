Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 55EC15C9A1
	for <lists+amd-gfx@lfdr.de>; Tue,  2 Jul 2019 08:58:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8805F89CB3;
	Tue,  2 Jul 2019 06:58:26 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700044.outbound.protection.outlook.com [40.107.70.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACC7389CB3
 for <amd-gfx@lists.freedesktop.org>; Tue,  2 Jul 2019 06:58:24 +0000 (UTC)
Received: from MN2PR12MB3437.namprd12.prod.outlook.com (20.178.240.212) by
 MN2PR12MB3903.namprd12.prod.outlook.com (10.255.238.24) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2032.20; Tue, 2 Jul 2019 06:58:23 +0000
Received: from MN2PR12MB3437.namprd12.prod.outlook.com
 ([fe80::14b7:2b0d:c355:bb32]) by MN2PR12MB3437.namprd12.prod.outlook.com
 ([fe80::14b7:2b0d:c355:bb32%5]) with mapi id 15.20.2032.019; Tue, 2 Jul 2019
 06:58:22 +0000
From: "Xiao, Jack" <Jack.Xiao@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amdkfd: remove an unused variable
Thread-Topic: [PATCH] drm/amdkfd: remove an unused variable
Thread-Index: AQHVMKOJswsYwohLvUelXceFASPxLQ==
Date: Tue, 2 Jul 2019 06:58:22 +0000
Message-ID: <1562050664-24740-1-git-send-email-Jack.Xiao@amd.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-clientproxiedby: HK0PR03CA0021.apcprd03.prod.outlook.com
 (2603:1096:203:2e::33) To MN2PR12MB3437.namprd12.prod.outlook.com
 (2603:10b6:208:c3::20)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 1.9.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 96627c9e-55e1-4c5c-3bd3-08d6febaabfa
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3903; 
x-ms-traffictypediagnostic: MN2PR12MB3903:
x-microsoft-antispam-prvs: <MN2PR12MB39033497D245E37E0B0274B6EFF80@MN2PR12MB3903.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1079;
x-forefront-prvs: 008663486A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(366004)(396003)(39860400002)(346002)(199004)(189003)(5640700003)(53936002)(6512007)(6436002)(52116002)(102836004)(68736007)(386003)(2351001)(7736002)(2501003)(14454004)(316002)(72206003)(50226002)(8676002)(81156014)(81166006)(8936002)(305945005)(6916009)(6486002)(66066001)(476003)(4326008)(2616005)(2906002)(256004)(99286004)(36756003)(6116002)(64756008)(86362001)(14444005)(486006)(3846002)(66446008)(478600001)(25786009)(71190400001)(5660300002)(73956011)(4744005)(66946007)(26005)(186003)(66556008)(66476007)(6506007)(71200400001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3903;
 H:MN2PR12MB3437.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: jpA70czPMdWMVgZ/o7sInZMeGtj98edPxNc30e7faxaoQCvdUXHMO1acOA3LNTScM1mNqXkN6+LRiDZ+ioYnZp//kof/Pja2WenxrTfi6TjAOjL2eSvdsmi+5yznFImxjmIn0VL3aRvMun2jH5UEVrZTICjFbv2L9zm5sf3mzsce6almg/Rz97kBIxUBVApIjlaQumTlwnseGo7zK2Oj8EohHYPuPyQw45OIlQSjPqAzmjwNA7lJ+PVBJ05I+QMUpYscI8sdG8nQVQ+fuSX/NYavDvbZgjRKzRbgm585hf4R7OTpA4nXEdpDmPTByT+QjB3cwysXxS3Xr0EIbu33UsLA3pi80OQ255Lmi3+M+29wC88cQFdUR/3luUgJJv/4L6omoJRX9Cjlbyld0K9Tre31VdgRBKK8wSERBqjioEc=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96627c9e-55e1-4c5c-3bd3-08d6febaabfa
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jul 2019 06:58:22.8085 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jacxiao@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3903
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8dsUAHjyJFJmfNgAJ7lrKItHGNriZ4gIa0Ohquxn+ak=;
 b=qSE45dWeIDf/7fn0M3OYK2tYUr215EtFyYqRpw+6ZtCvsZ8k71dL1LmQW4x4zoXZpARg9Ch2USfdghbplu73QvHSg/mDvDsT+AayevQ3B/NAKxUowUrjNHLXoorSxWFeElFKw7eeVK3KISSpSPUVudvAYrHqmfCUZ5IaLTRLZpQ=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Jack.Xiao@amd.com; 
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
Cc: "Xiao, Jack" <Jack.Xiao@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SnVzdCBmb3IgY2xlYW51cC4KClNpZ25lZC1vZmYtYnk6IEphY2sgWGlhbyA8SmFjay5YaWFvQGFt
ZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2RldmljZS5jIHwgMSAt
CiAxIGZpbGUgY2hhbmdlZCwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1ka2ZkL2tmZF9kZXZpY2UuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2Zk
L2tmZF9kZXZpY2UuYwppbmRleCAyNGRiODJiLi4zMzIyYTQ0IDEwMDY0NAotLS0gYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfZGV2aWNlLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRrZmQva2ZkX2RldmljZS5jCkBAIC00ODcsNyArNDg3LDYgQEAgc3RydWN0IGtmZF9kZXYg
KmtnZDJrZmRfcHJvYmUoc3RydWN0IGtnZF9kZXYgKmtnZCwKIAlzdHJ1Y3QgcGNpX2RldiAqcGRl
diwgY29uc3Qgc3RydWN0IGtmZDJrZ2RfY2FsbHMgKmYyZykKIHsKIAlzdHJ1Y3Qga2ZkX2RldiAq
a2ZkOwotCWludCByZXQ7CiAJY29uc3Qgc3RydWN0IGtmZF9kZXZpY2VfaW5mbyAqZGV2aWNlX2lu
Zm8gPQogCQkJCQlsb29rdXBfZGV2aWNlX2luZm8ocGRldi0+ZGV2aWNlKTsKIAotLSAKMS45LjEK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZngg
bWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
