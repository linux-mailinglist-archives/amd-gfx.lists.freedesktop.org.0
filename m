Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AAA3749E44
	for <lists+amd-gfx@lfdr.de>; Tue, 18 Jun 2019 12:31:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C5686E133;
	Tue, 18 Jun 2019 10:31:13 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790047.outbound.protection.outlook.com [40.107.79.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DADDF6E133
 for <amd-gfx@lists.freedesktop.org>; Tue, 18 Jun 2019 10:31:11 +0000 (UTC)
Received: from MN2PR12MB3437.namprd12.prod.outlook.com (20.178.240.212) by
 MN2PR12MB2877.namprd12.prod.outlook.com (20.179.81.160) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.15; Tue, 18 Jun 2019 10:31:10 +0000
Received: from MN2PR12MB3437.namprd12.prod.outlook.com
 ([fe80::eb:664e:7a9:5aa5]) by MN2PR12MB3437.namprd12.prod.outlook.com
 ([fe80::eb:664e:7a9:5aa5%6]) with mapi id 15.20.1965.019; Tue, 18 Jun 2019
 10:31:10 +0000
From: "Xiao, Jack" <Jack.Xiao@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Deucher, 
 Alexander" <Alexander.Deucher@amd.com>, "Zhang, Hawking"
 <Hawking.Zhang@amd.com>, "Koenig, Christian" <Christian.Koenig@amd.com>
Subject: [PATCH] drm/amdgpu: add job->preamble_status back to status value
Thread-Topic: [PATCH] drm/amdgpu: add job->preamble_status back to status value
Thread-Index: AQHVJcDxCRHB6A23IU6Ytvj4oIYh/w==
Date: Tue, 18 Jun 2019 10:31:09 +0000
Message-ID: <1560853789-22977-1-git-send-email-Jack.Xiao@amd.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-clientproxiedby: PS2PR04CA0017.apcprd04.prod.outlook.com
 (2603:1096:300:55::29) To MN2PR12MB3437.namprd12.prod.outlook.com
 (2603:10b6:208:c3::20)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 1.9.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 50672282-2bd8-4391-2dc8-08d6f3d813cb
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB2877; 
x-ms-traffictypediagnostic: MN2PR12MB2877:
x-microsoft-antispam-prvs: <MN2PR12MB28777FB3B4F4C3ECC4D67B1FEFEA0@MN2PR12MB2877.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3044;
x-forefront-prvs: 007271867D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(376002)(346002)(396003)(39860400002)(136003)(199004)(189003)(3846002)(6506007)(66556008)(5660300002)(256004)(478600001)(386003)(2501003)(476003)(4744005)(2616005)(71200400001)(486006)(73956011)(66476007)(26005)(66946007)(66446008)(64756008)(6636002)(71190400001)(7736002)(305945005)(186003)(99286004)(86362001)(52116002)(6116002)(2906002)(81156014)(81166006)(6436002)(8676002)(8936002)(53936002)(110136005)(50226002)(102836004)(36756003)(6512007)(316002)(25786009)(6486002)(4326008)(72206003)(14454004)(68736007)(66066001)(266184004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB2877;
 H:MN2PR12MB3437.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: zkLz9oc/C2N0B4lUB6CQs2CDrE4PuZqhZuIbZtoC97uCEup69tLzKvTLu4w2MRcMRq4oUeBjM8g/ePIVNgj9LBmLI3Z0Gaff+g9EQKb2l0s8nN/PKKhS3onUnWC+oKCYKbKyGdLCMRAUw48ChfdSvi3numnbnBuZRwuUS4Tf9gGYn413fyAW9rLxSDQnfTQyefHLuY8zmq9rqeWSV3E5QkzAAIL5LuBnBEUpGjjsaIrLAGCDFRqnC7Rj2SQXX8poLdgkB+fyBbWE1DZMPuJz9vrR91D7sDcxwl0At4EzzLcz/qiTkBNuqOKtGpbkMb+U16WuDGFTGpfPSs+UdUZRYPfb1Qe/YRDKWOrMFl4ZV9oQ8UJxr3yB8cInrnmhTIjbi/QTatjcDcHprcLaWeqUZXB6kJ/QPz5LHWiILqf6bT0=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50672282-2bd8-4391-2dc8-08d6f3d813cb
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jun 2019 10:31:10.1295 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jacxiao@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB2877
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OFdKHWJ644SxJcXWuHsdaXGd8442Ks4PTr0MML6eo20=;
 b=YUsCOS09ztxX1iMGvFpV6+WKJYRDjk1060K8F2sfrEdzmnT8klmTs227MQ+rJjN27eDnDcKxLwm2dD/DrrnS6vNlzfedH2F8zgcQhlsYmj0OIWyG+RIwyCNJUgQ8LiSmi8AYjueLNjjU3YUuIsmtM9kC4oNGLYhiS/evJ/YuiOA=
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

am9iLT5wcmVhbWJsZV9zdGF0dXMgd2FzIGFjY2lkZW50bHkgZHJvcHBlZCBmcm9tIHRoZSBjb21i
aW5hdGlvbiB2YWx1ZQ0Kb2Ygc3RhdHVzIHZhcmFpYWJsZSB3aGljaCBpcyB0aGUgcGFyYW1ldGVy
IG9mIHNvbWUgcmluZyBsZXZlbCBmdW5jdGlvbi4NClRoZSBwYXRjaCBpcyB0byBhZGQgaXQgYmFj
ay4NCg0KU2lnbmVkLW9mZi1ieTogSmFjayBYaWFvIDxKYWNrLlhpYW9AYW1kLmNvbT4NCi0tLQ0K
IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9pYi5jIHwgMSArDQogMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspDQoNCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfaWIuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9p
Yi5jDQppbmRleCA5MGNjMDg0Li42ODgyZWViIDEwMDY0NA0KLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X2liLmMNCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV9pYi5jDQpAQCAtMjA4LDYgKzIwOCw3IEBAIGludCBhbWRncHVfaWJfc2NoZWR1bGUo
c3RydWN0IGFtZGdwdV9yaW5nICpyaW5nLCB1bnNpZ25lZCBudW1faWJzLA0KIA0KIAlza2lwX3By
ZWFtYmxlID0gcmluZy0+Y3VycmVudF9jdHggPT0gZmVuY2VfY3R4Ow0KIAlpZiAoam9iICYmIHJp
bmctPmZ1bmNzLT5lbWl0X2NudHhjbnRsKSB7DQorCQlzdGF0dXMgfD0gam9iLT5wcmVhbWJsZV9z
dGF0dXM7DQogCQlzdGF0dXMgfD0gam9iLT5wcmVlbXB0aW9uX3N0YXR1czsNCiAJCWFtZGdwdV9y
aW5nX2VtaXRfY250eGNudGwocmluZywgc3RhdHVzKTsNCiAJfQ0KLS0gDQoxLjkuMQ0KDQpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxp
bmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
