Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5112F6D267
	for <lists+amd-gfx@lfdr.de>; Thu, 18 Jul 2019 18:53:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DEC96E42F;
	Thu, 18 Jul 2019 16:53:28 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740077.outbound.protection.outlook.com [40.107.74.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D7F46E42F
 for <amd-gfx@lists.freedesktop.org>; Thu, 18 Jul 2019 16:53:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OMMhJM+vvNcZY9iKclCkJbqqelWgzmIX6eKbek36W+r1sHctY4Rff0W5h0DCzZsNoAPC7Hvmi6IJtd6hkdY+0gCw15whpib1sZ2tyO0PZIul92oHb6Mw37Qiex2ZEV3yB2Oxj573ddhc0lj7ivdQS6jP5iSXq+MsYkCX8O8iGJpuJXONnXeR0212Ys7G9Ynz+kN5aWD65wTUUD6rpr/px6jKGz6kvTRLadEncXAF07iOblH6F6Sq01tYZYCMpj3D7aKz2c0Lnz9/tmQ+CgPYuL+MIOV83HrtJOPhr4Y36+LljRPPqnHbbAKhU1zyGuO7LxQJL5afpjbLwB3nWjFKBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kZI4WQd/6RhbtwAkX5vLUKtTGXBFNnB2ADKB6ohGtj0=;
 b=ZZKVnvMrQVQzSNdH1ioGs4RM3f4ZNSRTOdYFusGG6TmcEKk3Jn6aGtZHeSaNY3wRxNtL1mBTSFuhzIyim85T6xT1D1R208MLsWxNeOYc/O2JQHM1ChU+0p69YB1ktIpFF8UuToSYR0TWepD4yon/dYbozd1jHSEzp36hDGHWl5hmjfOE+yKBcxmO69apogL+6ALuk8aMnlglZes672XSQ2Dr96zPHeBpECMms15vCt9+Ptvp3pwDaPKBYMogzVLK/XcsNT9eO4Ade4YcBXZ0W/TTzGOMzRLCCmMGQwlfD8z5OaZPBxmQBCWDkmt7NhxxSDR7YVRfur0f0ckmD3wv8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from CY4PR12MB1302.namprd12.prod.outlook.com (10.168.164.148) by
 CY4PR12MB1445.namprd12.prod.outlook.com (10.172.72.137) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.11; Thu, 18 Jul 2019 16:53:25 +0000
Received: from CY4PR12MB1302.namprd12.prod.outlook.com
 ([fe80::c124:5267:775:e689]) by CY4PR12MB1302.namprd12.prod.outlook.com
 ([fe80::c124:5267:775:e689%4]) with mapi id 15.20.2073.012; Thu, 18 Jul 2019
 16:53:25 +0000
From: "StDenis, Tom" <Tom.StDenis@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] Collect all page_base_address bits for pte-further addresses
 (v2)
Thread-Topic: [PATCH] Collect all page_base_address bits for pte-further
 addresses (v2)
Thread-Index: AQHVPYlQVdLOH3JFiUact5LfCkGqFg==
Date: Thu, 18 Jul 2019 16:53:25 +0000
Message-ID: <20190718165317.31371-1-tom.stdenis@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BN7PR10CA0023.namprd10.prod.outlook.com
 (2603:10b6:406:bc::36) To CY4PR12MB1302.namprd12.prod.outlook.com
 (2603:10b6:903:38::20)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.21.0
x-originating-ip: [165.204.84.11]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 97bd37bf-40c0-466f-c795-08d70ba0733e
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:CY4PR12MB1445; 
x-ms-traffictypediagnostic: CY4PR12MB1445:
x-microsoft-antispam-prvs: <CY4PR12MB14459C195FC8587D1C8952D6F7C80@CY4PR12MB1445.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 01026E1310
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(396003)(366004)(376002)(346002)(136003)(199004)(189003)(14454004)(26005)(66066001)(25786009)(53936002)(3846002)(66446008)(186003)(64756008)(66556008)(6116002)(50226002)(52116002)(99286004)(81156014)(5660300002)(2501003)(102836004)(8936002)(7736002)(36756003)(68736007)(305945005)(81166006)(1076003)(478600001)(71200400001)(71190400001)(4326008)(386003)(316002)(4744005)(6506007)(486006)(476003)(6486002)(2616005)(14444005)(256004)(86362001)(6436002)(66946007)(6916009)(8676002)(2906002)(5640700003)(2351001)(66476007)(6512007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR12MB1445;
 H:CY4PR12MB1302.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: H/FnxZ0iM9boOQ7+M8lqtL1tjf630o3C0gF1uYV3d62VtnRrbrMK/RH3ZOIKq46mDM7vMjWFbvz01ZQ+/lUl7lIyFaX8p8KyJs5jRGbxGCqBF8TVtPI4ER1kOeHMxm++l0rd/AehMhw/nz00fjVqyPHxt9uR1T0bi65DMyrsVQB3BqyoqY5Dkt3kvFatGxoL75M4sjpvo6aJCmZOa8UX7PtuyZjSOasXRZ00iOx34onnUnW+2xIFeJ8LRvRh8UVGOnm1nMBUDX2H4yKz0c2Gl7PmAdRtdE7ZMQ93zOvDTZEdSAKqRg2Nzkg7VC0PIvKeO6PhnOFVOdvEHQoGP429GAB5DTkpGGaA3tRakmLdQL+PsYw+EvPNKg7L6U6o9e3JoJKxdHnk81QCFd3qF9khfOVBIN3PiutK0BmoWJHWvus=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97bd37bf-40c0-466f-c795-08d70ba0733e
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2019 16:53:25.5280 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tstdenis@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1445
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kZI4WQd/6RhbtwAkX5vLUKtTGXBFNnB2ADKB6ohGtj0=;
 b=QldNb86m7RMPxyrKcprKRwmszJgZnqbFp2T7CGDjI07atWxIznBrsqRpjhEbuYNHaUvJCX2ci/gYEcL6NHzhv4IRqMvZlJasg3nVMJRRxHiix5ZduDSuKW6uvs6p0JvIKdzUgNDfrifZVSoeYqXIw12goohCQYKVIH2u1x4LMnY=
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

VGhlIHNwZWNpZmljYXRpb24gc2F5cyB0byB0cmVhdCBhIFBURSB3aXRoIHRoZSBGIGJpdCBzZXQg
Imxpa2UgYSBQREUiCndoaWNoIG1lYW5zIHRoYXQgYWxsIGJ1dCB0aGUgbG93ZXIgNiBiaXRzIGFy
ZSBwYXJ0IG9mIHRoZSBwYWdlIGJhc2UKYWRkcmVzcy4gIEluZGVlZCwgaW4gdGhlIHdpbGQgYSBj
b21tZW50IGNhbWUgYmFjayBpbmRpY2F0aW5nIHRoYXQKd2Ugd2VyZSBzdHJpcHBpbmcgb2ZmIGJp
dHMgbmVlZGVkIHRvIHByb3Blcmx5IGZldGNoIHRoZSBuZXh0ClBURS4KCih2Mik6IE9ubHkgY2Fw
dHVyZSBleGNlc3MgYml0cyBpZiBpdCBpcyBhIFBURS1GVVJUSEVSIGVudHJ5CgpTaWduZWQtb2Zm
LWJ5OiBUb20gU3QgRGVuaXMgPHRvbS5zdGRlbmlzQGFtZC5jb20+Ci0tLQogc3JjL2xpYi9yZWFk
X3ZyYW0uYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlv
bigtKQoKZGlmZiAtLWdpdCBhL3NyYy9saWIvcmVhZF92cmFtLmMgYi9zcmMvbGliL3JlYWRfdnJh
bS5jCmluZGV4IGNiYThmNmIuLmU4M2E4NWMgMTAwNjQ0Ci0tLSBhL3NyYy9saWIvcmVhZF92cmFt
LmMKKysrIGIvc3JjL2xpYi9yZWFkX3ZyYW0uYwpAQCAtNjc2LDcgKzY3Niw3IEBAIHBkZV9pc19w
dGU6CiAJCQkJcHRlX2lkeCA9IChhZGRyZXNzID4+IDEyKSAmICgoMVVMTCA8PCBwZGVfZmllbGRz
LmZyYWdfc2l6ZSkgLSAxKTsKIAogCQkJCS8vIGdyYWIgUFRFIGJhc2UgYWRkcmVzcyBmcm9tIHRo
ZSBQVEUgdGhhdCBoYXMgdGhlIEYgYml0IHNldC4KLQkJCQlwZGVfZmllbGRzLnB0ZV9iYXNlX2Fk
ZHIgPSBwdGVfZmllbGRzLnBhZ2VfYmFzZV9hZGRyOworCQkJCXBkZV9maWVsZHMucHRlX2Jhc2Vf
YWRkciA9IHB0ZV9lbnRyeSAmIDB4RkZGRkZGRkZGRkMwVUxMOwogCQkJCWdvdG8gcHRlX2Z1cnRo
ZXI7CiAJCQl9CiAKLS0gCjIuMjEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9h
bWQtZ2Z4
