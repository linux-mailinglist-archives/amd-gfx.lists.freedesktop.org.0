Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CB9ABDF51
	for <lists+amd-gfx@lfdr.de>; Wed, 25 Sep 2019 15:45:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C71196EBC7;
	Wed, 25 Sep 2019 13:45:44 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam05on0617.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe51::617])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E56006EBCA;
 Wed, 25 Sep 2019 13:45:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S5zg7MdiOffAu28SqqE/uKSqHekfzlZf6p3rjk5HTYEWRciEz7t40w33L+LRsqFq8ZZdAQQiTYusPFqqLK9Lk+nPnYkSlCBK130BdYHifBWYG4UR73sAKtIkp43LOd+r0b1+Be30EsIIXmLbt5cNMPYw0uGessVW4yMUzwMvSouhk+mnUCFf2XLyDxL1vviJmvaFSPWyQgjfALMtk0ndwerMTdcqWaMcNqRyQi69Sn5GO2RUYT7lMhTEdPMBzmqItJHwKrpmW7J8+akO7bXg2Yg7qLZwfCDYejVbntBwPjE1rY7tlhBSHIzJLYyz3DE2GbXVpWxPtFvHJI5f5qrz0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YGE/iRY95VQl17s2DH3u2vWS8VWEdWXjz/qqaPhaeiM=;
 b=XlwPevLEcHil6287KzZbyQptWBNHTm0/VLHq1cjOFWaPRFWC/bTXUx+w0883ZBryTNYWrWZyHyic2aDuN7q3DfYMGfIUuZP758q5Cv3SJgjpe8gCmP6pyDyj3TFvSRujulQd9iMm+nkoHjl6+kEcRRn88stOEvDCTnJJiXPSSGA4+kjZ5ZfdUO6B6dV/J/TDXQ+WbTIgH+GBK7IBogLAIf9sE3eAl8FkWmhdl3BikTVrG+boTBnEXDuijff3YcHN6WTOQh0fLOniLWOVon4NBtvGit27HHCV0+IQoOsc3nSjWTYIlj4tBfsPi2m4E5BqdLSy18F8bLHd94G57R7EOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3309.namprd12.prod.outlook.com (20.179.83.157) by
 MN2PR12MB4304.namprd12.prod.outlook.com (10.255.224.204) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.20; Wed, 25 Sep 2019 13:45:39 +0000
Received: from MN2PR12MB3309.namprd12.prod.outlook.com
 ([fe80::e105:cd24:c71d:c38d]) by MN2PR12MB3309.namprd12.prod.outlook.com
 ([fe80::e105:cd24:c71d:c38d%4]) with mapi id 15.20.2305.016; Wed, 25 Sep 2019
 13:45:39 +0000
From: "Huang, Ray" <Ray.Huang@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>
Subject: [PATCH v2 09/11] drm/amdgpu: expand the context control interface
 with trust flag
Thread-Topic: [PATCH v2 09/11] drm/amdgpu: expand the context control
 interface with trust flag
Thread-Index: AQHVc6eDxqARTAv000ih97V+IZTkwQ==
Date: Wed, 25 Sep 2019 13:45:38 +0000
Message-ID: <1569419090-5304-10-git-send-email-ray.huang@amd.com>
References: <1569419090-5304-1-git-send-email-ray.huang@amd.com>
In-Reply-To: <1569419090-5304-1-git-send-email-ray.huang@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-clientproxiedby: HK2PR02CA0186.apcprd02.prod.outlook.com
 (2603:1096:201:21::22) To MN2PR12MB3309.namprd12.prod.outlook.com
 (2603:10b6:208:106::29)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.7.4
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: adf5d892-a8d9-475b-04e7-08d741bea642
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MN2PR12MB4304; 
x-ms-traffictypediagnostic: MN2PR12MB4304:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB4304B295B79BD2E2ADF76E2BEC870@MN2PR12MB4304.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:81;
x-forefront-prvs: 01713B2841
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(136003)(376002)(346002)(396003)(366004)(189003)(199004)(86362001)(8936002)(305945005)(2501003)(50226002)(6636002)(256004)(6486002)(6116002)(3846002)(6436002)(6512007)(2906002)(4326008)(66066001)(102836004)(26005)(186003)(52116002)(76176011)(486006)(476003)(2616005)(11346002)(66946007)(66476007)(66556008)(64756008)(66446008)(446003)(99286004)(5660300002)(81156014)(6506007)(81166006)(450100002)(25786009)(36756003)(316002)(478600001)(386003)(8676002)(71190400001)(71200400001)(110136005)(54906003)(7736002)(14454004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB4304;
 H:MN2PR12MB3309.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: wxrWwr3BXw9ENoJFO4ZrvoOQoBoZUJ03CI8rbJiav1VBKT3CnPo+YuGxFwD/4nVTpYA+j3nBygnkrxJNzTGq+6xfo7QDKJFGZ3b8NfjYT22POZpGjVXhWnSOw3PQPfOuPUg1umZn3mFFu8kY/klg5dBy6RXJM+SoCMXHsTx58QqgIrLnYAssAZv/Z3ULORZQLOWAGVYjKEr+vBrewUjjPs74aaZ6cYaHj0p3bDz3u5lsLdRU0aZF8aA5irDbmJFZIV3IzmtMqjd8a75k4yFd0DIy47IS5t9T98z5GipE3ygKOfCthQHEkEmOdACkrjZ5gql8gLspt6Em8EQJUC93j+zXlKEE7JLRPQrymnwuYmQKriztDWzD4MJxuur5WbRh9j5XsmtgzO1rMBymA0AfGOX/QIUNS5/dilWuEaCyxBg=
Content-ID: <CA8C0F969FC0AB4C83BE9CDBB2F7973C@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: adf5d892-a8d9-475b-04e7-08d741bea642
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Sep 2019 13:45:38.9488 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WavW5COM1UcRH0M9OEPzfBHvS3Tfb8J6OuXyHzSqKpIe/DcIN962i3lYTUDlq7KFyHjdeWwBf0igp6SDdjxRZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4304
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YGE/iRY95VQl17s2DH3u2vWS8VWEdWXjz/qqaPhaeiM=;
 b=KoUtjbVDwklml7QckROBl1hBX14CM0RNIbU4PysHk4filM14YAMjV9ID3/VhDC71dagQ7UQGSRi///ZRzfqHPFc1ydY0u7/LGkMnNYDsy6x8NcTzbhToVupkjD2hcwGFWw+H4FfgI7LxbMlmQ9lSSlBQBblUk3Ny7XA+M1SbH4w=
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
Cc: "Tuikov, Luben" <Luben.Tuikov@amd.com>, "Huang, Ray" <Ray.Huang@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>, "Liu,
 Aaron" <Aaron.Liu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhpcyBwYXRjaCBleHBhbmRzIHRoZSBjb250ZXh0IGNvbnRyb2wgZnVuY3Rpb24gdG8gc3VwcG9y
dCB0cnVzdGVkIGZsYWcgd2hpbGUgd2UNCndhbnQgdG8gc2V0IGNvbW1hbmQgYnVmZmVyIGluIHRy
dXN0ZWQgbW9kZS4NCg0KU2lnbmVkLW9mZi1ieTogSHVhbmcgUnVpIDxyYXkuaHVhbmdAYW1kLmNv
bT4NClJldmlld2VkLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+
DQpBY2tlZC1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPg0K
LS0tDQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2liLmMgICB8IDIgKy0NCiBk
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmluZy5oIHwgNSArKystLQ0KIGRyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92MTBfMC5jICAgfCA0ICsrKy0NCiBkcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9nZnhfdjZfMC5jICAgIHwgMyArKy0NCiBkcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9nZnhfdjdfMC5jICAgIHwgMyArKy0NCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9nZnhfdjhfMC5jICAgIHwgMyArKy0NCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9n
ZnhfdjlfMC5jICAgIHwgNSArKystLQ0KIDcgZmlsZXMgY2hhbmdlZCwgMTYgaW5zZXJ0aW9ucygr
KSwgOSBkZWxldGlvbnMoLSkNCg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV9pYi5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2liLmMN
CmluZGV4IDU0NzQxYmEuLmUxZGMyMjkgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfaWIuYw0KKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X2liLmMNCkBAIC0yMTAsNyArMjEwLDcgQEAgaW50IGFtZGdwdV9pYl9zY2hlZHVsZShzdHJ1
Y3QgYW1kZ3B1X3JpbmcgKnJpbmcsIHVuc2lnbmVkIG51bV9pYnMsDQogCWlmIChqb2IgJiYgcmlu
Zy0+ZnVuY3MtPmVtaXRfY250eGNudGwpIHsNCiAJCXN0YXR1cyB8PSBqb2ItPnByZWFtYmxlX3N0
YXR1czsNCiAJCXN0YXR1cyB8PSBqb2ItPnByZWVtcHRpb25fc3RhdHVzOw0KLQkJYW1kZ3B1X3Jp
bmdfZW1pdF9jbnR4Y250bChyaW5nLCBzdGF0dXMpOw0KKwkJYW1kZ3B1X3JpbmdfZW1pdF9jbnR4
Y250bChyaW5nLCBzdGF0dXMsIGZhbHNlKTsNCiAJfQ0KIA0KIAlmb3IgKGkgPSAwOyBpIDwgbnVt
X2liczsgKytpKSB7DQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X3JpbmcuaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yaW5nLmgNCmlu
ZGV4IDM0YWE2M2EuLjUxMzRkMGQgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfcmluZy5oDQorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfcmluZy5oDQpAQCAtMTU4LDcgKzE1OCw4IEBAIHN0cnVjdCBhbWRncHVfcmluZ19mdW5jcyB7
DQogCXZvaWQgKCpiZWdpbl91c2UpKHN0cnVjdCBhbWRncHVfcmluZyAqcmluZyk7DQogCXZvaWQg
KCplbmRfdXNlKShzdHJ1Y3QgYW1kZ3B1X3JpbmcgKnJpbmcpOw0KIAl2b2lkICgqZW1pdF9zd2l0
Y2hfYnVmZmVyKSAoc3RydWN0IGFtZGdwdV9yaW5nICpyaW5nKTsNCi0Jdm9pZCAoKmVtaXRfY250
eGNudGwpIChzdHJ1Y3QgYW1kZ3B1X3JpbmcgKnJpbmcsIHVpbnQzMl90IGZsYWdzKTsNCisJdm9p
ZCAoKmVtaXRfY250eGNudGwpIChzdHJ1Y3QgYW1kZ3B1X3JpbmcgKnJpbmcsIHVpbnQzMl90IGZs
YWdzLA0KKwkJCSAgICAgICBib29sIHRydXN0ZWQpOw0KIAl2b2lkICgqZW1pdF9ycmVnKShzdHJ1
Y3QgYW1kZ3B1X3JpbmcgKnJpbmcsIHVpbnQzMl90IHJlZyk7DQogCXZvaWQgKCplbWl0X3dyZWcp
KHN0cnVjdCBhbWRncHVfcmluZyAqcmluZywgdWludDMyX3QgcmVnLCB1aW50MzJfdCB2YWwpOw0K
IAl2b2lkICgqZW1pdF9yZWdfd2FpdCkoc3RydWN0IGFtZGdwdV9yaW5nICpyaW5nLCB1aW50MzJf
dCByZWcsDQpAQCAtMjQyLDcgKzI0Myw3IEBAIHN0cnVjdCBhbWRncHVfcmluZyB7DQogI2RlZmlu
ZSBhbWRncHVfcmluZ19lbWl0X2dkc19zd2l0Y2gociwgdiwgZGIsIGRzLCB3Yiwgd3MsIGFiLCBh
cykgKHIpLT5mdW5jcy0+ZW1pdF9nZHNfc3dpdGNoKChyKSwgKHYpLCAoZGIpLCAoZHMpLCAod2Ip
LCAod3MpLCAoYWIpLCAoYXMpKQ0KICNkZWZpbmUgYW1kZ3B1X3JpbmdfZW1pdF9oZHBfZmx1c2go
cikgKHIpLT5mdW5jcy0+ZW1pdF9oZHBfZmx1c2goKHIpKQ0KICNkZWZpbmUgYW1kZ3B1X3Jpbmdf
ZW1pdF9zd2l0Y2hfYnVmZmVyKHIpIChyKS0+ZnVuY3MtPmVtaXRfc3dpdGNoX2J1ZmZlcigocikp
DQotI2RlZmluZSBhbWRncHVfcmluZ19lbWl0X2NudHhjbnRsKHIsIGQpIChyKS0+ZnVuY3MtPmVt
aXRfY250eGNudGwoKHIpLCAoZCkpDQorI2RlZmluZSBhbWRncHVfcmluZ19lbWl0X2NudHhjbnRs
KHIsIGQsIHMpIChyKS0+ZnVuY3MtPmVtaXRfY250eGNudGwoKHIpLCAoZCksIChzKSkNCiAjZGVm
aW5lIGFtZGdwdV9yaW5nX2VtaXRfcnJlZyhyLCBkKSAociktPmZ1bmNzLT5lbWl0X3JyZWcoKHIp
LCAoZCkpDQogI2RlZmluZSBhbWRncHVfcmluZ19lbWl0X3dyZWcociwgZCwgdikgKHIpLT5mdW5j
cy0+ZW1pdF93cmVnKChyKSwgKGQpLCAodikpDQogI2RlZmluZSBhbWRncHVfcmluZ19lbWl0X3Jl
Z193YWl0KHIsIGQsIHYsIG0pIChyKS0+ZnVuY3MtPmVtaXRfcmVnX3dhaXQoKHIpLCAoZCksICh2
KSwgKG0pKQ0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92MTBf
MC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3YxMF8wLmMNCmluZGV4IDE4Zjc0
MWIuLjA2Njk4YzIgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhf
djEwXzAuYw0KKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3YxMF8wLmMNCkBA
IC00NTE0LDcgKzQ1MTQsOSBAQCBzdGF0aWMgdm9pZCBnZnhfdjEwXzBfcmluZ19lbWl0X3NiKHN0
cnVjdCBhbWRncHVfcmluZyAqcmluZykNCiAJYW1kZ3B1X3Jpbmdfd3JpdGUocmluZywgMCk7DQog
fQ0KIA0KLXN0YXRpYyB2b2lkIGdmeF92MTBfMF9yaW5nX2VtaXRfY250eGNudGwoc3RydWN0IGFt
ZGdwdV9yaW5nICpyaW5nLCB1aW50MzJfdCBmbGFncykNCitzdGF0aWMgdm9pZCBnZnhfdjEwXzBf
cmluZ19lbWl0X2NudHhjbnRsKHN0cnVjdCBhbWRncHVfcmluZyAqcmluZywNCisJCQkJCSB1aW50
MzJfdCBmbGFncywNCisJCQkJCSBib29sIHRydXN0ZWQpDQogew0KIAl1aW50MzJfdCBkdzIgPSAw
Ow0KIA0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92Nl8wLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjZfMC5jDQppbmRleCA4YzI3YzMwLi5i
NGFmMWI1IDEwMDY0NA0KLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y2XzAu
Yw0KKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y2XzAuYw0KQEAgLTI5NzIs
NyArMjk3Miw4IEBAIHN0YXRpYyB1aW50NjRfdCBnZnhfdjZfMF9nZXRfZ3B1X2Nsb2NrX2NvdW50
ZXIoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpDQogCXJldHVybiBjbG9jazsNCiB9DQogDQot
c3RhdGljIHZvaWQgZ2Z4X3Y2X3JpbmdfZW1pdF9jbnR4Y250bChzdHJ1Y3QgYW1kZ3B1X3Jpbmcg
KnJpbmcsIHVpbnQzMl90IGZsYWdzKQ0KK3N0YXRpYyB2b2lkIGdmeF92Nl9yaW5nX2VtaXRfY250
eGNudGwoc3RydWN0IGFtZGdwdV9yaW5nICpyaW5nLCB1aW50MzJfdCBmbGFncywNCisJCQkJICAg
ICAgYm9vbCB0cnVzdGVkKQ0KIHsNCiAJaWYgKGZsYWdzICYgQU1ER1BVX0hBVkVfQ1RYX1NXSVRD
SCkNCiAJCWdmeF92Nl8wX3JpbmdfZW1pdF92Z3RfZmx1c2gocmluZyk7DQpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y3XzAuYyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2dmeF92N18wLmMNCmluZGV4IDQ4Nzk2YjY4Li5jMDhmNWM1IDEwMDY0NA0KLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y3XzAuYw0KKysrIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y3XzAuYw0KQEAgLTIzMDksNyArMjMwOSw4IEBAIHN0YXRp
YyB2b2lkIGdmeF92N18wX3JpbmdfZW1pdF9pYl9jb21wdXRlKHN0cnVjdCBhbWRncHVfcmluZyAq
cmluZywNCiAJYW1kZ3B1X3Jpbmdfd3JpdGUocmluZywgY29udHJvbCk7DQogfQ0KIA0KLXN0YXRp
YyB2b2lkIGdmeF92N19yaW5nX2VtaXRfY250eGNudGwoc3RydWN0IGFtZGdwdV9yaW5nICpyaW5n
LCB1aW50MzJfdCBmbGFncykNCitzdGF0aWMgdm9pZCBnZnhfdjdfcmluZ19lbWl0X2NudHhjbnRs
KHN0cnVjdCBhbWRncHVfcmluZyAqcmluZywgdWludDMyX3QgZmxhZ3MsDQorCQkJCSAgICAgIGJv
b2wgdHJ1c3RlZCkNCiB7DQogCXVpbnQzMl90IGR3MiA9IDA7DQogDQpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y4XzAuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2dmeF92OF8wLmMNCmluZGV4IDk4ZTVhYTguLmQzYTIzZmQgMTAwNjQ0DQotLS0gYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjhfMC5jDQorKysgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9nZnhfdjhfMC5jDQpAQCAtNjM5Myw3ICs2MzkzLDggQEAgc3RhdGljIHZv
aWQgZ2Z4X3Y4X3JpbmdfZW1pdF9zYihzdHJ1Y3QgYW1kZ3B1X3JpbmcgKnJpbmcpDQogCWFtZGdw
dV9yaW5nX3dyaXRlKHJpbmcsIDApOw0KIH0NCiANCi1zdGF0aWMgdm9pZCBnZnhfdjhfcmluZ19l
bWl0X2NudHhjbnRsKHN0cnVjdCBhbWRncHVfcmluZyAqcmluZywgdWludDMyX3QgZmxhZ3MpDQor
c3RhdGljIHZvaWQgZ2Z4X3Y4X3JpbmdfZW1pdF9jbnR4Y250bChzdHJ1Y3QgYW1kZ3B1X3Jpbmcg
KnJpbmcsIHVpbnQzMl90IGZsYWdzLA0KKwkJCQkgICAgICBib29sIHRydXN0ZWQpDQogew0KIAl1
aW50MzJfdCBkdzIgPSAwOw0KIA0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2dmeF92OV8wLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjlfMC5jDQpp
bmRleCBmYTI2NGQ1Li44NzJkMTAwIDEwMDY0NA0KLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvZ2Z4X3Y5XzAuYw0KKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y5
XzAuYw0KQEAgLTUyNTMsMTQgKzUyNTMsMTUgQEAgc3RhdGljIHZvaWQgZ2Z4X3Y5XzBfcmluZ19l
bWl0X3RteihzdHJ1Y3QgYW1kZ3B1X3JpbmcgKnJpbmcsIGJvb2wgc3RhcnQsDQogCQkJICB8IEZS
QU1FX0NNRChzdGFydCA/IDAgOiAxKSk7DQogfQ0KIA0KLXN0YXRpYyB2b2lkIGdmeF92OV9yaW5n
X2VtaXRfY250eGNudGwoc3RydWN0IGFtZGdwdV9yaW5nICpyaW5nLCB1aW50MzJfdCBmbGFncykN
CitzdGF0aWMgdm9pZCBnZnhfdjlfcmluZ19lbWl0X2NudHhjbnRsKHN0cnVjdCBhbWRncHVfcmlu
ZyAqcmluZywgdWludDMyX3QgZmxhZ3MsDQorCQkJCSAgICAgIGJvb2wgdHJ1c3RlZCkNCiB7DQog
CXVpbnQzMl90IGR3MiA9IDA7DQogDQogCWlmIChhbWRncHVfc3Jpb3ZfdmYocmluZy0+YWRldikp
DQogCQlnZnhfdjlfMF9yaW5nX2VtaXRfY2VfbWV0YShyaW5nKTsNCiANCi0JZ2Z4X3Y5XzBfcmlu
Z19lbWl0X3RteihyaW5nLCB0cnVlLCBmYWxzZSk7DQorCWdmeF92OV8wX3JpbmdfZW1pdF90bXoo
cmluZywgdHJ1ZSwgdHJ1c3RlZCk7DQogDQogCWR3MiB8PSAweDgwMDAwMDAwOyAvKiBzZXQgbG9h
ZF9lbmFibGUgb3RoZXJ3aXNlIHRoaXMgcGFja2FnZSBpcyBqdXN0IE5PUHMgKi8NCiAJaWYgKGZs
YWdzICYgQU1ER1BVX0hBVkVfQ1RYX1NXSVRDSCkgew0KLS0gDQoyLjcuNA0KDQpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlz
dAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
