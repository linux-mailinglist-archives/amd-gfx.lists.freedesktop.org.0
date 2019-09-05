Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 703FAAAB2F
	for <lists+amd-gfx@lfdr.de>; Thu,  5 Sep 2019 20:37:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 947A36E0EE;
	Thu,  5 Sep 2019 18:37:00 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810059.outbound.protection.outlook.com [40.107.81.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89D516E0EE
 for <amd-gfx@lists.freedesktop.org>; Thu,  5 Sep 2019 18:36:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=egD0FX9wjPcPa4ls8/BerVkvutKsn8jLl9dv6PsXmQgKvG+a7LP4O4dXJToPLykhdIWRYR7SuI6tvKtvhktdLId6HZyuobMDo/c3+ziX3kym/8cbwKfGHnad9OrZOYmda5cfeMaOy45tHtv/3NGwdJ77dwb4dL4+f8uzdOlnVTN7tGXgIeEXzrR1daiuIwW7YRRAjAK8ImOZcsw7K/t3EA54205rdWajH8xYyPTOO3urVzz8Gbm0hexvIUnQThrb+FZ0rDpTQQuVbsz/56U2bN0BQnp1CfrMSnx4voOYVcwC+RRTQjSos6cdqaSy8IjrBFUWpCzLMA4Ft+oBNabzUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ASpiznC09h9w5G9q5rkU84wvUod3Oy7SO0vS1+jze2w=;
 b=aiBie8/k/8rg9wpYkvq1CyN7oXYcPZ3jVBWSQxIhQF7bFV+ZvUfYX6B860IJ6GMZt4KqMyN+4YCbpYCqnQ/PIwaWjokkn0GNW3W6lM23F15nknGETWmQ5sM1FVUEif8sjOjtpJTuvLzzkIRQeKpZBsg7gC5/6CK9SaCOXbT253JAgeUm65EJZJNV7roTmrRJXkUJ8r8Db0HEqcaGdo7CpYKdfk36PBOXScU5I1fpom4OuwYraPoZMroX9UKwznA/dXyrDe/ggZ33fOHyeJYeMxS6usG2SaqaTpBsfB2FM6nFVMBzsXIwKhbiuTjnVuMTvqILhnx00W+AxNWeWZqDGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3309.namprd12.prod.outlook.com (20.179.83.157) by
 MN2PR12MB2877.namprd12.prod.outlook.com (20.179.81.160) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.15; Thu, 5 Sep 2019 18:36:54 +0000
Received: from MN2PR12MB3309.namprd12.prod.outlook.com
 ([fe80::d923:13e5:46f4:6e77]) by MN2PR12MB3309.namprd12.prod.outlook.com
 ([fe80::d923:13e5:46f4:6e77%3]) with mapi id 15.20.2220.022; Thu, 5 Sep 2019
 18:36:54 +0000
From: "Huang, Ray" <Ray.Huang@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v2 01/10] drm/amdkfd: add renoir cache info for CRAT (v2)
Thread-Topic: [PATCH v2 01/10] drm/amdkfd: add renoir cache info for CRAT (v2)
Thread-Index: AQHVZBjk6KtBYYcF5U6g269Snk5OEQ==
Date: Thu, 5 Sep 2019 18:36:54 +0000
Message-ID: <1567708597-18831-1-git-send-email-ray.huang@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-clientproxiedby: HK2PR03CA0052.apcprd03.prod.outlook.com
 (2603:1096:202:17::22) To MN2PR12MB3309.namprd12.prod.outlook.com
 (2603:10b6:208:106::29)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.7.4
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f1714c47-7795-4bba-cf0f-08d732300666
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB2877; 
x-ms-traffictypediagnostic: MN2PR12MB2877:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB2877C3207F877354F36F1DE5ECBB0@MN2PR12MB2877.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:873;
x-forefront-prvs: 015114592F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(346002)(136003)(39860400002)(396003)(366004)(189003)(199004)(71190400001)(3846002)(2351001)(14444005)(316002)(256004)(54906003)(71200400001)(6916009)(66066001)(8936002)(5660300002)(102836004)(6506007)(8676002)(386003)(86362001)(81156014)(81166006)(4326008)(50226002)(36756003)(25786009)(6116002)(5640700003)(7736002)(305945005)(2906002)(486006)(2616005)(186003)(26005)(2501003)(476003)(99286004)(6486002)(6512007)(52116002)(6436002)(66446008)(64756008)(66556008)(66476007)(66946007)(53936002)(14454004)(478600001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB2877;
 H:MN2PR12MB3309.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 1pzG29V+HOqaPxGN75oGoiAA+1E0Nkh0UF7dy0lr82qBJhCWnJ0r/wmUYwh1NVaMxk6yAwm48QtUL8cXiKMK1CalZlBGckbYDfm0h2S0tyFtTe7cA6LKLtyFDcuwm7WP3hkLsGGgohpsv7XaIj8QI6+R39KC+JU4/XmY9ahBWx1IHDJi1mlKsHaUqyP68XgDLh2w9NiYEwNOJ5KRYUe9Rj9UwFlLrRzoxrFRq3qQ/9tH9n2Z/X5F8acG5GGi4kRFUtt5f8kocFnEbF/QyLCZ6QKcfI54JaX4W+M2SiEjeiNosxnGBFEzkjvNEuhaoTkJq3rvuYIilchSKDhzULE1oPlt+jBHGC2J5NJliSEdeXzRaBXHzzMVlYVVKQXIYbCKZAsbIewJpWAXsztr7EVknV2uhKNBfuEcZ7Inc/ESukQ=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1714c47-7795-4bba-cf0f-08d732300666
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Sep 2019 18:36:54.8151 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 178UDLrrHRsCX4V6ah3p05qRHiXmOyRNdKkpo/siHAFWpboq9YbVIjlD3mL0fZQjg/pZgKWxQidHVR0s1zh+AA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB2877
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ASpiznC09h9w5G9q5rkU84wvUod3Oy7SO0vS1+jze2w=;
 b=0ti9hgyulR7DS3z5LKwwJLVHL1TwrreetKD5w1Up4KlEYN9Fx2epLBzvD1fya89/odyW+4vrOUrWeU/LgQdm2jkgNI0DTPVL0H9fNVHHzTdF9cAorCl88S4xRvh//E5QlsZeBpD2Sck9eYJ15OdMRc0AQA3ZMOt7VtQtwUoZGG0=
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

UmVub2lyJ3MgY2FjaGUgaW5mbyBzaG91bGQgYmUgdGhlIHNhbWUgd2l0aCByYXZlbiBhbmQgY2Fy
cml6bydzLgoKdjI6IGZpeCBtaXNzZWQgImJyZWFrIgoKU2lnbmVkLW9mZi1ieTogSHVhbmcgUnVp
IDxyYXkuaHVhbmdAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRf
Y3JhdC5jIHwgNSArKysrKwogMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9jcmF0LmMgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGtmZC9rZmRfY3JhdC5jCmluZGV4IDY2Mzg3Y2EuLmIxMTVhMDEgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9jcmF0LmMKKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2NyYXQuYwpAQCAtMTM4LDYgKzEzOCw3IEBAIHN0YXRp
YyBzdHJ1Y3Qga2ZkX2dwdV9jYWNoZV9pbmZvIGNhcnJpem9fY2FjaGVfaW5mb1tdID0gewogLyog
VE9ETyAtIGNoZWNrICYgdXBkYXRlIFZlZ2ExMCBjYWNoZSBkZXRhaWxzICovCiAjZGVmaW5lIHZl
Z2ExMF9jYWNoZV9pbmZvIGNhcnJpem9fY2FjaGVfaW5mbwogI2RlZmluZSByYXZlbl9jYWNoZV9p
bmZvIGNhcnJpem9fY2FjaGVfaW5mbworI2RlZmluZSByZW5vaXJfY2FjaGVfaW5mbyBjYXJyaXpv
X2NhY2hlX2luZm8KIC8qIFRPRE8gLSBjaGVjayAmIHVwZGF0ZSBOYXZpMTAgY2FjaGUgZGV0YWls
cyAqLwogI2RlZmluZSBuYXZpMTBfY2FjaGVfaW5mbyBjYXJyaXpvX2NhY2hlX2luZm8KIApAQCAt
NjcwLDYgKzY3MSwxMCBAQCBzdGF0aWMgaW50IGtmZF9maWxsX2dwdV9jYWNoZV9pbmZvKHN0cnVj
dCBrZmRfZGV2ICprZGV2LAogCQlwY2FjaGVfaW5mbyA9IHJhdmVuX2NhY2hlX2luZm87CiAJCW51
bV9vZl9jYWNoZV90eXBlcyA9IEFSUkFZX1NJWkUocmF2ZW5fY2FjaGVfaW5mbyk7CiAJCWJyZWFr
OworCWNhc2UgQ0hJUF9SRU5PSVI6CisJCXBjYWNoZV9pbmZvID0gcmVub2lyX2NhY2hlX2luZm87
CisJCW51bV9vZl9jYWNoZV90eXBlcyA9IEFSUkFZX1NJWkUocmVub2lyX2NhY2hlX2luZm8pOwor
CQlicmVhazsKIAljYXNlIENISVBfTkFWSTEwOgogCQlwY2FjaGVfaW5mbyA9IG5hdmkxMF9jYWNo
ZV9pbmZvOwogCQludW1fb2ZfY2FjaGVfdHlwZXMgPSBBUlJBWV9TSVpFKG5hdmkxMF9jYWNoZV9p
bmZvKTsKLS0gCjIuNy40CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
