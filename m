Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B0D7737FEA
	for <lists+amd-gfx@lfdr.de>; Thu,  6 Jun 2019 23:51:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AF44899B0;
	Thu,  6 Jun 2019 21:51:35 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720082.outbound.protection.outlook.com [40.107.72.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 876C7899B0
 for <amd-gfx@lists.freedesktop.org>; Thu,  6 Jun 2019 21:51:34 +0000 (UTC)
Received: from BL0PR12MB2580.namprd12.prod.outlook.com (52.132.27.147) by
 BL0PR12MB2580.namprd12.prod.outlook.com (52.132.27.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1943.22; Thu, 6 Jun 2019 21:51:33 +0000
Received: from BL0PR12MB2580.namprd12.prod.outlook.com
 ([fe80::24a0:610c:5b5c:9b9b]) by BL0PR12MB2580.namprd12.prod.outlook.com
 ([fe80::24a0:610c:5b5c:9b9b%5]) with mapi id 15.20.1943.023; Thu, 6 Jun 2019
 21:51:33 +0000
From: "Zeng, Oak" <Oak.Zeng@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amdkfd: Initialize dqm earlier
Thread-Topic: [PATCH] drm/amdkfd: Initialize dqm earlier
Thread-Index: AQHVHLIBFJGLVzlZGUi5mMfQcpn2Sg==
Date: Thu, 6 Jun 2019 21:51:32 +0000
Message-ID: <1559857887-7096-1-git-send-email-Oak.Zeng@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YT1PR01CA0021.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::34)
 To BL0PR12MB2580.namprd12.prod.outlook.com
 (2603:10b6:207:3e::19)
x-mailer: git-send-email 2.7.4
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7212144f-b443-490d-15e7-08d6eac92399
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BL0PR12MB2580; 
x-ms-traffictypediagnostic: BL0PR12MB2580:
x-microsoft-antispam-prvs: <BL0PR12MB2580710D2FACCDF6F53223E180170@BL0PR12MB2580.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1824;
x-forefront-prvs: 00603B7EEF
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(346002)(136003)(396003)(366004)(376002)(189003)(199004)(8936002)(99286004)(54906003)(52116002)(6116002)(25786009)(50226002)(2906002)(6916009)(66066001)(102836004)(81166006)(6486002)(66946007)(73956011)(6512007)(66446008)(64756008)(66556008)(66476007)(81156014)(256004)(6506007)(386003)(316002)(71190400001)(305945005)(71200400001)(8676002)(4326008)(6436002)(186003)(7736002)(5660300002)(53936002)(14454004)(86362001)(68736007)(26005)(3846002)(478600001)(72206003)(36756003)(486006)(476003)(2351001)(2501003)(2616005)(5640700003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BL0PR12MB2580;
 H:BL0PR12MB2580.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: TUzbCD4JgwXfG+WTCk/1yKCoEL6ufPlrgiAwARtpYqzeCe9SIK/TNSFphyePlGtmlZj8CEP6aQfWOG/k7zeBWjviUw7PjtqLSS7NRN/bcwrNJRLkJj2IPSLMVy/aeXy70SU33w0JVolFojQnQi+5IZzpeY/ce9ORcrYbUheOWlqoWoTU/OFZlu0Xw/D1lLCbNRFqAffdYOOh4sTmqWfW/1oGdUJ4NhfX5DqtS18LVJztiGWTuLM6AM/UIxJmaLzpaMCYZJ7E7bLDXWwAqxUZ3KabMmfPzELlh5LgOor3pz+166OhmOEhtXLpa+mA4YWWs2H+mRea1THBzHuF73eJjQiAsJVpoSKy0fR6BC34IPaBHBtjrq5gIBJPZsFddZS54aeCZz/UJPA6sufLRqBQulPdAaTguUOOKsooagmicm8=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7212144f-b443-490d-15e7-08d6eac92399
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jun 2019 21:51:32.8973 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ozeng@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2580
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OXPSVC04xaB/fjJHmbGhHjK7vADJh+EGdFNTLlkaNck=;
 b=fOoDSnA/hEkkn1bhe+hphroKbktEUY2bXgTlsBwJcXv6UwNAY1yA0V7ucxsCcNdUMuakXJNC/zG0L1hu/fuGbptv4E9n0/wt6xTdPvnBf41pzcsm6gmsZQH3DnXchQNp0Xy8mOrwsEhiZOnK/vZyrEKv70INnMxuB3gpguRUfYI=
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
Cc: "Kuehling, Felix" <Felix.Kuehling@amd.com>, "Zeng, Oak" <Oak.Zeng@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

ZHFtIGlzIHJlZmVyZW5jZWQgaW4gZnVuY3Rpb24ga2ZkX3RvcGxvZ3lfYWRkX2RldmljZS4NCk1v
dmUgZHFtIGluaXRpYWxpemF0aW9uIHVwIHRvIGF2b2lkIE5VTEwgcG9pbnRlciByZWZlcmVuY2Uu
DQoNCkNoYW5nZS1JZDogSWQ2Y2IyNTQxYWYxMjk4MjZiNzYyMWNlYWE4ZTA2ZTYzOGM3YmIxMjIN
ClNpZ25lZC1vZmYtYnk6IE9hayBaZW5nIDxPYWsuWmVuZ0BhbWQuY29tPg0KLS0tDQogZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2RldmljZS5jIHwgMTYgKysrKysrKystLS0tLS0tLQ0K
IDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pDQoNCmRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfZGV2aWNlLmMgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfZGV2aWNlLmMNCmluZGV4IDlkMWIwMjYuLmU3ZTI0ZmUg
MTAwNjQ0DQotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfZGV2aWNlLmMNCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9kZXZpY2UuYw0KQEAgLTYwMyw2ICs2
MDMsMTIgQEAgYm9vbCBrZ2Qya2ZkX2RldmljZV9pbml0KHN0cnVjdCBrZmRfZGV2ICprZmQsDQog
CWlmIChrZmQtPmtmZDJrZ2QtPmdldF9oaXZlX2lkKQ0KIAkJa2ZkLT5oaXZlX2lkID0ga2ZkLT5r
ZmQya2dkLT5nZXRfaGl2ZV9pZChrZmQtPmtnZCk7DQogDQorCWtmZC0+ZHFtID0gZGV2aWNlX3F1
ZXVlX21hbmFnZXJfaW5pdChrZmQpOw0KKwlpZiAoIWtmZC0+ZHFtKSB7DQorCQlkZXZfZXJyKGtm
ZF9kZXZpY2UsICJFcnJvciBpbml0aWFsaXppbmcgcXVldWUgbWFuYWdlclxuIik7DQorCQlnb3Rv
IGRldmljZV9xdWV1ZV9tYW5hZ2VyX2Vycm9yOw0KKwl9DQorDQogCWlmIChrZmRfdG9wb2xvZ3lf
YWRkX2RldmljZShrZmQpKSB7DQogCQlkZXZfZXJyKGtmZF9kZXZpY2UsICJFcnJvciBhZGRpbmcg
ZGV2aWNlIHRvIHRvcG9sb2d5XG4iKTsNCiAJCWdvdG8ga2ZkX3RvcG9sb2d5X2FkZF9kZXZpY2Vf
ZXJyb3I7DQpAQCAtNjEzLDEyICs2MTksNiBAQCBib29sIGtnZDJrZmRfZGV2aWNlX2luaXQoc3Ry
dWN0IGtmZF9kZXYgKmtmZCwNCiAJCWdvdG8ga2ZkX2ludGVycnVwdF9lcnJvcjsNCiAJfQ0KIA0K
LQlrZmQtPmRxbSA9IGRldmljZV9xdWV1ZV9tYW5hZ2VyX2luaXQoa2ZkKTsNCi0JaWYgKCFrZmQt
PmRxbSkgew0KLQkJZGV2X2VycihrZmRfZGV2aWNlLCAiRXJyb3IgaW5pdGlhbGl6aW5nIHF1ZXVl
IG1hbmFnZXJcbiIpOw0KLQkJZ290byBkZXZpY2VfcXVldWVfbWFuYWdlcl9lcnJvcjsNCi0JfQ0K
LQ0KIAlpZiAoa2ZkX2lvbW11X2RldmljZV9pbml0KGtmZCkpIHsNCiAJCWRldl9lcnIoa2ZkX2Rl
dmljZSwgIkVycm9yIGluaXRpYWxpemluZyBpb21tdXYyXG4iKTsNCiAJCWdvdG8gZGV2aWNlX2lv
bW11X2Vycm9yOw0KQEAgLTY0MiwxMiArNjQyLDEyIEBAIGJvb2wga2dkMmtmZF9kZXZpY2VfaW5p
dChzdHJ1Y3Qga2ZkX2RldiAqa2ZkLA0KIA0KIGtmZF9yZXN1bWVfZXJyb3I6DQogZGV2aWNlX2lv
bW11X2Vycm9yOg0KLQlkZXZpY2VfcXVldWVfbWFuYWdlcl91bmluaXQoa2ZkLT5kcW0pOw0KLWRl
dmljZV9xdWV1ZV9tYW5hZ2VyX2Vycm9yOg0KIAlrZmRfaW50ZXJydXB0X2V4aXQoa2ZkKTsNCiBr
ZmRfaW50ZXJydXB0X2Vycm9yOg0KIAlrZmRfdG9wb2xvZ3lfcmVtb3ZlX2RldmljZShrZmQpOw0K
IGtmZF90b3BvbG9neV9hZGRfZGV2aWNlX2Vycm9yOg0KKwlkZXZpY2VfcXVldWVfbWFuYWdlcl91
bmluaXQoa2ZkLT5kcW0pOw0KK2RldmljZV9xdWV1ZV9tYW5hZ2VyX2Vycm9yOg0KIAlrZmRfZG9v
cmJlbGxfZmluaShrZmQpOw0KIGtmZF9kb29yYmVsbF9lcnJvcjoNCiAJa2ZkX2d0dF9zYV9maW5p
KGtmZCk7DQotLSANCjIuNy40DQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1k
LWdmeA==
