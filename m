Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BE42F5F1B7
	for <lists+amd-gfx@lfdr.de>; Thu,  4 Jul 2019 05:09:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57D88897E3;
	Thu,  4 Jul 2019 03:09:18 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720049.outbound.protection.outlook.com [40.107.72.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C8458912D
 for <amd-gfx@lists.freedesktop.org>; Thu,  4 Jul 2019 03:09:17 +0000 (UTC)
Received: from SN6PR12MB2800.namprd12.prod.outlook.com (52.135.107.150) by
 SN6PR12MB2798.namprd12.prod.outlook.com (52.135.107.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2032.20; Thu, 4 Jul 2019 03:09:15 +0000
Received: from SN6PR12MB2800.namprd12.prod.outlook.com
 ([fe80::4c4f:4a38:712d:928d]) by SN6PR12MB2800.namprd12.prod.outlook.com
 ([fe80::4c4f:4a38:712d:928d%5]) with mapi id 15.20.2052.010; Thu, 4 Jul 2019
 03:09:15 +0000
From: "Pan, Xinhui" <Xinhui.Pan@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amdgpu: Disable ras features on all IPs before gpu reset
Thread-Topic: [PATCH] drm/amdgpu: Disable ras features on all IPs before gpu
 reset
Thread-Index: AdUyFb9pMVuXa1LORx+z1ctn/wLFlA==
Date: Thu, 4 Jul 2019 03:09:15 +0000
Message-ID: <SN6PR12MB2800A452CC9315AE18E83E9D87FA0@SN6PR12MB2800.namprd12.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f29fd5d3-6077-45b4-6c57-08d7002cff19
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:SN6PR12MB2798; 
x-ms-traffictypediagnostic: SN6PR12MB2798:
x-microsoft-antispam-prvs: <SN6PR12MB279806D5FDA50F73751D140D87FA0@SN6PR12MB2798.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:519;
x-forefront-prvs: 0088C92887
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(346002)(39860400002)(376002)(396003)(366004)(199004)(189003)(33656002)(186003)(2351001)(73956011)(66946007)(8676002)(76116006)(3846002)(72206003)(8936002)(81156014)(6506007)(102836004)(66476007)(52536014)(7696005)(4744005)(81166006)(26005)(5660300002)(64756008)(6116002)(66446008)(9686003)(53936002)(68736007)(5640700003)(74316002)(55016002)(7736002)(305945005)(4326008)(316002)(66556008)(478600001)(2501003)(486006)(71200400001)(2906002)(256004)(71190400001)(66066001)(14444005)(6436002)(476003)(25786009)(99286004)(86362001)(14454004)(6916009);
 DIR:OUT; SFP:1101; SCL:1; SRVR:SN6PR12MB2798;
 H:SN6PR12MB2800.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: hhkcXr4ShIvuTnO/upy1MMniP+COC/z0O5D4h6ijvG/Vh9RXP+/9Ca9nuWvzrsEY/kpDZ6DaHNSjJFaqkOLSG9oNglCO6re95KJ5nef2vtbSwsKvenkjJTNt+w6Q3ktg8FgwEQUqv1RWJNQUpTSVg4eNVp8+d4kVd+O/qWc0rnL58g+RlaAHUZvdjXSUGQVUrvKCTaNKvqsPdQis44Xi7kqTAlmdtF6YyiUlwDngYRGRdkd6qyClYiURYTdElCPMmWtjgaKwAPRfcKrLi+1D0q1ZS+lBC5IpxHua3WOksGxlBX3udhxf9c3BFuAl6Z0n+W2S/Ti0OsQdoGXibZePHMMsCgPAA2sGcZr8FwzTfdZv8tlmTgQBAC7Asrs4ayv7sG1j9ahwI8j0FHI6IuDihhBAspPfay9cI3AWnFsVa9Y=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f29fd5d3-6077-45b4-6c57-08d7002cff19
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jul 2019 03:09:15.3952 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xpan@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2798
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YiHjOXVqMYuZcQeP7/8xq7TByrnCnoFjtkYHqcf21Ms=;
 b=niwgUSEU4aq74Y9aicb4UmFsMOhHoqpazAfss53JhR0HGaz4GK4DrelKywn/ilfucwEY+xmJ7NIAVGY/oPAatuMpi+673wCXl4oyGTJWIbfeC3DqcNMVOShwpfRg3R8kGqL7NfqDQv2cxf9gBV6O9u143aLNj2eVUmMtBmlQlkE=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Xinhui.Pan@amd.com; 
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UGVyZm9ybSBhIHJhc19zdXNwZW5kIHRvIGRpc2FibGUgcmFzIG9uIGFsbCBJUHMgdG8gd29ya2Fy
b3VuZApzb21lIFJPQ20gc3RhYmlsaXR5IGlzc3VlLgoKU2lnbmVkLW9mZi1ieTogeGluaHVpIHBh
biA8eGluaHVpLnBhbkBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9kZXZpY2UuYyB8IDQgKysrKwogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQoK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYwppbmRleCA1MTMyYzU5
YjQzOTcuLjk5MjA4ZmU2ODRhYSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X2RldmljZS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV9kZXZpY2UuYwpAQCAtMzc1OSw2ICszNzU5LDEwIEBAIGludCBhbWRncHVfZGV2aWNlX2dwdV9y
ZWNvdmVyKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAogCiAJLyogYmxvY2sgYWxsIHNjaGVk
dWxlcnMgYW5kIHJlc2V0IGdpdmVuIGpvYidzIHJpbmcgKi8KIAlsaXN0X2Zvcl9lYWNoX2VudHJ5
KHRtcF9hZGV2LCBkZXZpY2VfbGlzdF9oYW5kbGUsIGdtYy54Z21pLmhlYWQpIHsKKwkJLyogZGlz
YWJsZSByYXMgb24gQUxMIElQcyAqLworCQlpZiAoYW1kZ3B1X2RldmljZV9pcF9uZWVkX2Z1bGxf
cmVzZXQodG1wX2FkZXYpKQorCQkJYW1kZ3B1X3Jhc19zdXNwZW5kKHRtcF9hZGV2KTsKKwogCQlm
b3IgKGkgPSAwOyBpIDwgQU1ER1BVX01BWF9SSU5HUzsgKytpKSB7CiAJCQlzdHJ1Y3QgYW1kZ3B1
X3JpbmcgKnJpbmcgPSB0bXBfYWRldi0+cmluZ3NbaV07CiAKLS0gCjIuMTcuMQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxp
c3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
