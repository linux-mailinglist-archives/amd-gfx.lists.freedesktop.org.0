Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17408CBDD4
	for <lists+amd-gfx@lfdr.de>; Fri,  4 Oct 2019 16:48:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7934A6EBBE;
	Fri,  4 Oct 2019 14:48:46 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790045.outbound.protection.outlook.com [40.107.79.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E1EF6EBBE
 for <amd-gfx@lists.freedesktop.org>; Fri,  4 Oct 2019 14:48:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mF96PDlQAYOJ5D6uKbzEMzYmDl52e/IueWxWKzrBUQHCLqQlTm8EcYvKpnyC5L3fvOQRm7cXAJKjE9aecJ7I6cMl0hhsrrOXGhd0SahEk0L9YlcLkoL+e4QeR/72ZPntec++3MrT9B7sar2n9P+23cTDcGqkKm0i2vjyaOY5LaWY1EPTnPlyDT2PCRmwgPvVi/C6bATYpxfVaqxL3oqnLNI681/gkLYF2ojuWGzGVu4CD6iXVyC5EFa5RsSJFAWNW+9LQxvV8riswST4lZpHkOmLlQb5z2FJjUkLul0jqJac8zNOFIne6xo2VDiftD3WObGcmA/XeuSneueHNKiqzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4QlPDkaSA17UW49ltHamvgGx9ezWUiA3+7lubTpbliM=;
 b=Zkcst8w+xkZkRCnyVXf+xTu7lFuCx1jJeXTYMSyAKPlXlY+hOL43LH00B2parQVTpS1j+tFoxAXSvcZgFqgTq6QGLnHSHMCmnPcBr5ivHlZCfJuzgzA+5HshvDMMsSn/KTZuYEH85nMzYlmKwjuqLtDlUH/9A5X3CL52FEdEyWfhks3+HJY1pp1CF85njcOXE0UgDx4GGPTHf2nUkwTm8O2NzXOnDumJBKbI/rivnFTWDmrLCJfUv5iZh7rXUon7xU6vGOyq/jtSkfrHeS6/rUOQaOhfv90/H6zqTJ1cIlQwXVZSP41AzBuh/+QgVgsDCs08LRlKcwOTC0GDtvJsXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BL0PR12MB2580.namprd12.prod.outlook.com (52.132.27.147) by
 BL0PR12MB2340.namprd12.prod.outlook.com (52.132.11.30) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Fri, 4 Oct 2019 14:48:43 +0000
Received: from BL0PR12MB2580.namprd12.prod.outlook.com
 ([fe80::145c:4149:8b99:c3b4]) by BL0PR12MB2580.namprd12.prod.outlook.com
 ([fe80::145c:4149:8b99:c3b4%6]) with mapi id 15.20.2305.023; Fri, 4 Oct 2019
 14:48:43 +0000
From: "Zeng, Oak" <Oak.Zeng@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 1/2] drm/amdkfd: Fix MQD size calculation
Thread-Topic: [PATCH 1/2] drm/amdkfd: Fix MQD size calculation
Thread-Index: AQHVesLRKN1jBOVXnUu3f+IdCLXhJA==
Date: Fri, 4 Oct 2019 14:48:43 +0000
Message-ID: <1570200515-18992-1-git-send-email-Oak.Zeng@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTBPR01CA0026.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::39) To BL0PR12MB2580.namprd12.prod.outlook.com
 (2603:10b6:207:3e::19)
x-mailer: git-send-email 2.7.4
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 285644c8-6f81-40fc-df30-08d748d9f390
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: BL0PR12MB2340:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BL0PR12MB2340D2E8D8F0C921456011B2809E0@BL0PR12MB2340.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2803;
x-forefront-prvs: 018093A9B5
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(39860400002)(346002)(396003)(376002)(136003)(199004)(189003)(66946007)(6116002)(3846002)(5640700003)(66476007)(64756008)(2906002)(6486002)(66556008)(6436002)(66446008)(102836004)(6506007)(26005)(14444005)(386003)(71200400001)(71190400001)(256004)(52116002)(4326008)(186003)(5660300002)(99286004)(7736002)(305945005)(2501003)(6916009)(8936002)(86362001)(476003)(14454004)(81166006)(478600001)(8676002)(2616005)(6512007)(54906003)(316002)(81156014)(486006)(25786009)(2351001)(50226002)(66066001)(36756003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BL0PR12MB2340;
 H:BL0PR12MB2580.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: r8t9ta/VdAZfQo0/uOoBvobuonXEQlp7MojKVMQ4XiRg+zHE/SbayteQd/+jxYrK2/s/jNrC7C0YG8hOlH7j0etxkXbq3zD8uQP9jlFntp3Wd4+Z61yb7IUBZlxwp4ynXcEa4O6rk8WeJSGeB5FPcOOvT6QaUtvCD1Sr1VV+l5xAweJSPBrU0xtGDF5HwzJKUKP4vwHCwfE7AwivsAxt8xYNM61fVv6PQIDA/mjs7F7SOeAZh2RO/jWmsx+F38VSbyJjVandR6+pwRGwqm4eYkY3t3sNy9JbjBtVKAKZTlSngM5MriZOcWMOk0y9EQwEismc0pUCYXqIwaIb1c55hWU1gDHStGlfolUw7N9iyZTCkM1Fn8/ZeVZfOLOA68kejlvWO+zXWcevPbzFyVJemBJRqCp+UiV9U8pmEIgQ08M=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 285644c8-6f81-40fc-df30-08d748d9f390
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Oct 2019 14:48:43.0633 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wEXtoxR35NlCXWyto+kRSBsbpO6oFQlmBUWow7K/WrF3hJoPcGQzD/yY9Gtz2tyc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2340
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4QlPDkaSA17UW49ltHamvgGx9ezWUiA3+7lubTpbliM=;
 b=Z9Ftl1Wt2eN4U1xDersP4rNl5NOqBsqonndS7doC84w+jpd2DZkQjJPRleiqNR8uca1XmiON28m8n7RDMdhJB5nGXZJcIMsvaVGEwLEv8i7xN0fpfWT4tZucjdM3deiiiS6o3oXY0z+6Q/zXJpnjBqPPt0/laEPIkx6hGpCyDxQ=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Oak.Zeng@amd.com; 
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
Cc: "Kuehling, Felix" <Felix.Kuehling@amd.com>, "Kim,
 Jonathan" <Jonathan.Kim@amd.com>, "Zeng, Oak" <Oak.Zeng@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gZGV2aWNlIGluaXRpYWxpemF0aW9uLCBhIHRydW5rIG9mIEdUVCBtZW1vcnkgaXMgcHJlLWFs
bG9jYXRlZCBmb3IKSElRIGFuZCBhbGwgU0RNQSBxdWV1ZXMgbXFkLiBUaGUgc2l6ZSBvZiB0aGlz
IGFsbG9jYXRpb24gd2FzIHdyb25nLgpUaGUgY29ycmVjdCBzZG1hIGVuZ2luZSBudW1iZXIgc2hv
dWxkIGJlIFBDSWUtb3B0aW1pemVkIFNETUEgZW5naW5lCm51bWJlciBwbHVzIHhnbWkgU0RNQSBl
bmdpbmUgbnVtYmVyLgoKQ2hhbmdlLUlkOiBJZWNkMTFhZTRmNWEzMTQ1OTE1NjY3NzJhYTJhMjNl
MWZlNGI5NDI3NQpSZXBvcnRlZC1ieTogSm9uYXRoYW4gS2ltIDxKb25hdGhhbi5LaW1AYW1kLmNv
bT4KU2lnbmVkLW9mZi1ieTogSm9uYXRoYW4gS2ltIDxKb25hdGhhbi5LaW1AYW1kLmNvbT4KU2ln
bmVkLW9mZi1ieTogT2FrIFplbmcgPE9hay5aZW5nQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRrZmQva2ZkX2RldmljZV9xdWV1ZV9tYW5hZ2VyLmMgfCAzICsrLQogMSBmaWxl
IGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9kZXZpY2VfcXVldWVfbWFuYWdlci5jIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2RldmljZV9xdWV1ZV9tYW5hZ2VyLmMKaW5kZXgg
MTZjMDRmOC4uZTU1ZDAyMSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQv
a2ZkX2RldmljZV9xdWV1ZV9tYW5hZ2VyLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRr
ZmQva2ZkX2RldmljZV9xdWV1ZV9tYW5hZ2VyLmMKQEAgLTE4NDksNyArMTg0OSw4IEBAIHN0YXRp
YyBpbnQgYWxsb2NhdGVfaGlxX3NkbWFfbXFkKHN0cnVjdCBkZXZpY2VfcXVldWVfbWFuYWdlciAq
ZHFtKQogCXN0cnVjdCBrZmRfZGV2ICpkZXYgPSBkcW0tPmRldjsKIAlzdHJ1Y3Qga2ZkX21lbV9v
YmogKm1lbV9vYmogPSAmZHFtLT5oaXFfc2RtYV9tcWQ7CiAJdWludDMyX3Qgc2l6ZSA9IGRxbS0+
bXFkX21ncnNbS0ZEX01RRF9UWVBFX1NETUFdLT5tcWRfc2l6ZSAqCi0JCWRldi0+ZGV2aWNlX2lu
Zm8tPm51bV9zZG1hX2VuZ2luZXMgKgorCQkoZGV2LT5kZXZpY2VfaW5mby0+bnVtX3NkbWFfZW5n
aW5lcyArCisJCWRldi0+ZGV2aWNlX2luZm8tPm51bV94Z21pX3NkbWFfZW5naW5lcykqCiAJCWRl
di0+ZGV2aWNlX2luZm8tPm51bV9zZG1hX3F1ZXVlc19wZXJfZW5naW5lICsKIAkJZHFtLT5tcWRf
bWdyc1tLRkRfTVFEX1RZUEVfSElRXS0+bXFkX3NpemU7CiAKLS0gCjIuNy40CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlz
dAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
