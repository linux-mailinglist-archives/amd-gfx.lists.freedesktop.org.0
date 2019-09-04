Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35D3DA8625
	for <lists+amd-gfx@lfdr.de>; Wed,  4 Sep 2019 17:48:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF06289BF5;
	Wed,  4 Sep 2019 15:48:28 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710075.outbound.protection.outlook.com [40.107.71.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F0FF89BDB
 for <amd-gfx@lists.freedesktop.org>; Wed,  4 Sep 2019 15:48:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e4FcZxc5Re+wV6CMkheBQeBypKwhea5UufzAkFOYODtaVbMIG2yPANWIp1NWzNCNzDv7+V3dOA9IzDtWNGMRo4RkM0nGVjVrd+OoOWGXOWOBP0j8UgrniGAUKbz+qwTSFDCkLdoUyKufGBebJzkTaihV4oB0EJ3uEFw9hjpenpEFMk/0onYmkWV4ddMa1zo+us3WK5696AEgq9GYoOLKiVdWifyLH8e/s+7yoVe8/8NbAsAQbp+EfpnYG3Rxibq5TVUTKEHdAGaxIpczvjEx4vUaRU8ZX225j3Kxf5l0L4GUPvdwfLZIZqy+Y4fbGtazXgjlrbIU4a5PhmD/kPVWgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jAzhG1JiALIgW1pms1HfCl1gi+8foaYRQPw2kKRvdFY=;
 b=RIu4sd6RmwmGH53/U6Ma9JiEf4w6O+4bZKjw5nicPMJhOPcZaC/vAJvJhKeB39ECyBkXoU0mQAzmy4civ7kzu9hEq2SOUfzkj9P23qT+NJQ6DIJdwGiQ8SsAePNQK8cMfOeiLPsiJ9d9I1qD8cGhvfXtaZ4gJS0E8cJFGtKJCdC4kx1Zh99axgMxRibp/WzFffKoVCzS7YQ4Vm+8Ha/OTQXB9gytmkE1TVuShSKvPTIKL8FEGBwaU/v5MSRnYI8RenfV/CMI7j78DY+ODKXZoldJVQSIOzjBAcISyqxILWxfvh7zYihA/JjfqVZkWFVhWEvqhSFT3Blzt+CkbMvpXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3309.namprd12.prod.outlook.com (20.179.83.157) by
 MN2PR12MB3199.namprd12.prod.outlook.com (20.179.81.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.16; Wed, 4 Sep 2019 15:48:25 +0000
Received: from MN2PR12MB3309.namprd12.prod.outlook.com
 ([fe80::d923:13e5:46f4:6e77]) by MN2PR12MB3309.namprd12.prod.outlook.com
 ([fe80::d923:13e5:46f4:6e77%3]) with mapi id 15.20.2220.022; Wed, 4 Sep 2019
 15:48:25 +0000
From: "Huang, Ray" <Ray.Huang@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 00/10] drm/amdkfd: introduce the kfd support for Renoir
Thread-Topic: [PATCH 00/10] drm/amdkfd: introduce the kfd support for Renoir
Thread-Index: AQHVYzgvm95Ta0FBh0GVkRJCX3TSrg==
Date: Wed, 4 Sep 2019 15:48:25 +0000
Message-ID: <20190904154803.5102-1-ray.huang@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
x-clientproxiedby: YTOPR0101CA0021.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::34) To MN2PR12MB3309.namprd12.prod.outlook.com
 (2603:10b6:208:106::29)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4b56a04e-e8c7-4f56-3f1c-08d7314f5253
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3199; 
x-ms-traffictypediagnostic: MN2PR12MB3199:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB3199376D22DAEC32FCA26762ECB80@MN2PR12MB3199.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 0150F3F97D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(396003)(136003)(346002)(39860400002)(366004)(189003)(199004)(53754006)(6916009)(186003)(66946007)(305945005)(1076003)(478600001)(6486002)(66446008)(6512007)(86362001)(25786009)(476003)(53936002)(81166006)(64756008)(386003)(66066001)(8936002)(6436002)(50226002)(7736002)(52116002)(81156014)(5660300002)(99286004)(486006)(66476007)(2906002)(3846002)(66556008)(14454004)(2616005)(36756003)(316002)(256004)(8676002)(5640700003)(54906003)(71200400001)(102836004)(4326008)(2351001)(26005)(2501003)(71190400001)(6116002)(6506007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3199;
 H:MN2PR12MB3309.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: wagzkL+wJ7ocg8rylhNysEsA95SMw6DySA8AWw1nH9AoPPDBLAyBBchvYCncpfaaNKmiPbrKJDOhFPMIBtaLo9xYQMFdQsSzNWKfxg7SsvWGYNRtDFoDQvIDrfQZSDuKr8IRfNMvtgvc8RQBW0k79A7Xy4e3wwtL4yZlanvEsC9bXX5yrwi6z/Ufsd0UDo0qwvHrmfzyEje45B6GffvnMONpuiBaPoBBb3gUWntvJWVLR+Jr8SPPL/xRhfLZkqM7haGIzM5KW+ldS3u+EGxqKu++hMF+6xjhGFPJFPCoxg5WXfxNPcP1/kGsS8zLKtVLiGS0QXnKCmzH/SVpHT4syBrxQeJEOaFyYOJE/thSPedHQw9J1lZoR5mnigMq+Haqw0obhdAzDiCntpHsy3H//gpCVWtfyUkP32X71N7GJ60=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b56a04e-e8c7-4f56-3f1c-08d7314f5253
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Sep 2019 15:48:25.2037 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +K1vC0//2wjnGemVGnalN2j0NB9iTu5gHB4+3zneROYYC6PI3n9oVdXC6PkzX4UsKroDUGKBVKiuw5ZLuSkwTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3199
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jAzhG1JiALIgW1pms1HfCl1gi+8foaYRQPw2kKRvdFY=;
 b=d9F8nEu9BIM69RVSCIQjy0hOwKZyhEpPfDlJ287S4y0ACY914ZN3J4cRM2e+N+Jr/4oa+CyxdVkhbVMT493I/3BeEUUQ1DzdL/SVteH5KHQAuGk45jEyIxjnB3pvD91VvBBuvLlR13LAxSldD9w+lUbuCBLCp1Pobi3FCBL2rCE=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Ray.Huang@amd.com; 
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Kuehling,
 Felix" <Felix.Kuehling@amd.com>, "Huang, Ray" <Ray.Huang@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SGkgYWxsLAoKVGhlc2UgcGF0Y2ggc2V0IHByb3ZpZGVzIHRoZSBrZmQgc3VwcG9ydCBmb3IgUk9D
bSBzdGFjayBvbiBSZW5vaXIgQVBVLgoKVGhhbmtzLApSYXkKCkh1YW5nIFJ1aSAoMTApOgogIGRy
bS9hbWRrZmQ6IGFkZCByZW5vaXIgY2FjaGUgaW5mbyBmb3IgQ1JBVAogIGRybS9hbWRrZmQ6IGFk
ZCByZW5vaXIga2ZkIGRldmljZSBpbmZvCiAgZHJtL2FtZGtmZDogZW5hYmxlIGtmZCBkZXZpY2Ug
cXVldWUgbWFuYWdlciB2OSBmb3IgcmVub2lyCiAgZHJtL2FtZGtmZDogYWRkIHJlbm9pciB0eXBz
IGZvciB0aGUgd29ya2Fyb3VuZCBvZiBpb21tdSB2MgogIGRybS9hbWRrZmQ6IGluaXQga2ZkIGFw
ZXJ0dXJlcyB2OSBmb3IgcmVub2lyCiAgZHJtL2FtZGtmZDogaW5pdCBrZXJuZWwgcXVldWUgZm9y
IHJlbm9pcgogIGRybS9hbWRrZmQ6IGFkZCBwYWNrYWdlIG1hbmFnZXIgZm9yIHJlbm9pcgogIGRy
bS9hbWRrZmQ6IGFkZCByZW5vaXIga2ZkIHRvcG9sb2d5CiAgZHJtL2FtZGdwdTogZGlzYWJsZSBn
ZnhvZmYgd2hpbGUgdXNlIG5vIEgvVyBzY2hlZHVsaW5nIHBvbGljeQogIGRybS9hbWRrZmQ6IGVu
YWJsZSByZW5vaXIgd2hpbGUgZGV2aWNlIHByb2JlcwoKIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdS5oICAgICAgICAgICAgICAgICAgIHwgIDEgKwogZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X2FtZGtmZC5jICAgICAgICAgICAgfCAgMSArCiBkcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMgICAgICAgICAgICB8ICAyICstCiBkcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfY3JhdC5jICAgICAgICAgICAgICAgICB8ICA0ICsrKysK
IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9kZXZpY2UuYyAgICAgICAgICAgICAgIHwg
MTkgKysrKysrKysrKysrKysrKysrKwogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2Rl
dmljZV9xdWV1ZV9tYW5hZ2VyLmMgfCAgMSArCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9r
ZmRfZXZlbnRzLmMgICAgICAgICAgICAgICB8ICAzICsrLQogZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRrZmQva2ZkX2ZsYXRfbWVtb3J5LmMgICAgICAgICAgfCAgMSArCiBkcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGtmZC9rZmRfa2VybmVsX3F1ZXVlLmMgICAgICAgICB8ICAxICsKIGRyaXZlcnMvZ3B1
L2RybS9hbWQvYW1ka2ZkL2tmZF9wYWNrZXRfbWFuYWdlci5jICAgICAgIHwgIDEgKwogZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX3RvcG9sb2d5LmMgICAgICAgICAgICAgfCAgMSArCiAx
MSBmaWxlcyBjaGFuZ2VkLCAzMyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKLS0gCjIu
Ny40CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQt
Z2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
