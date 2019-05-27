Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 35A392B30D
	for <lists+amd-gfx@lfdr.de>; Mon, 27 May 2019 13:16:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4E09897AC;
	Mon, 27 May 2019 11:16:46 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700076.outbound.protection.outlook.com [40.107.70.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E01D4897AC
 for <amd-gfx@lists.freedesktop.org>; Mon, 27 May 2019 11:16:45 +0000 (UTC)
Received: from BYAPR12MB2632.namprd12.prod.outlook.com (20.176.255.209) by
 BYAPR12MB3142.namprd12.prod.outlook.com (20.178.55.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1922.15; Mon, 27 May 2019 11:16:43 +0000
Received: from BYAPR12MB2632.namprd12.prod.outlook.com
 ([fe80::896f:c96c:96e1:2064]) by BYAPR12MB2632.namprd12.prod.outlook.com
 ([fe80::896f:c96c:96e1:2064%5]) with mapi id 15.20.1922.021; Mon, 27 May 2019
 11:16:43 +0000
From: "Zhang, Hawking" <Hawking.Zhang@amd.com>
To: "Xiao, Jack" <Jack.Xiao@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amdgpu: enable PCIE atomics ops support
Thread-Topic: [PATCH] drm/amdgpu: enable PCIE atomics ops support
Thread-Index: AQHVFHWiV+KPu3QpmUS98wAwuoZ18qZ+yNFA
Date: Mon, 27 May 2019 11:16:43 +0000
Message-ID: <BYAPR12MB26323A2A4408EB2EBB1A1448FC1D0@BYAPR12MB2632.namprd12.prod.outlook.com>
References: <1558952326-5611-1-git-send-email-Jack.Xiao@amd.com>
In-Reply-To: <1558952326-5611-1-git-send-email-Jack.Xiao@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0cc2b473-81fb-4eb9-622f-08d6e294ccd2
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:BYAPR12MB3142; 
x-ms-traffictypediagnostic: BYAPR12MB3142:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <BYAPR12MB314252238C2910E8627C8064FC1D0@BYAPR12MB3142.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0050CEFE70
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(346002)(39860400002)(396003)(376002)(366004)(136003)(199004)(189003)(13464003)(256004)(486006)(110136005)(74316002)(54906003)(6306002)(8676002)(478600001)(81166006)(55016002)(2501003)(6246003)(305945005)(5660300002)(229853002)(8936002)(476003)(26005)(446003)(4326008)(53936002)(52536014)(99286004)(33656002)(71200400001)(71190400001)(6506007)(53546011)(6436002)(9686003)(14444005)(81156014)(7696005)(102836004)(76176011)(6116002)(3846002)(86362001)(186003)(14454004)(72206003)(966005)(11346002)(68736007)(64756008)(66446008)(25786009)(66556008)(66476007)(76116006)(66946007)(73956011)(66066001)(316002)(7736002)(2906002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB3142;
 H:BYAPR12MB2632.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 906tVfzxCLH8eGNKQu+4ZQcsHK7xuNlg+7pwMirVRMJGEEQxDN8pwmgkC/FhnqOdDdy8T08ffw67AzPVGg7dXsnscGfZCpYEQrmGw7Dn/mvgVDuKF8RyWlUUx/jVuPWfoBea54nMEdYbHPqzT34yMRCWQx3t6eUZz3sYgyiMz9btIUyGJqJop5euDKaltjesv4raBpUUh6fJT+pixZwDhtT7evmzqddgJ7LuibxDuggzGMZOhOr1oG0VXLpigjD3tq+7bewqqWYIjhmaXJ9igWIQg/jLygOeuT5zi4FbvuDtJZiQ0zxgm4IO1z36iYi29avOS3hU3j4RdmdH4YPpRz+agVDITPHsJmzPW1wdGiwO1455/Rr3tESY1n5/HAK8sfCBtXP9zjSKckxSe+oMIotY7IsOn572rdp7Da9/abc=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cc2b473-81fb-4eb9-622f-08d6e294ccd2
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 May 2019 11:16:43.6542 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hawzhang@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3142
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mIz64rs/k2fjs8F7Yx7yXmzaCaKN1ofcLZGw+RZZqC8=;
 b=g+SM2SouE0+sZ8oJ4ehniOmxlehpMpBePSB9U+dYEcZ+SGmVVRAc5daxVkpfbLeqhYgL2mupP8juuV5S5z26mi9tNHZiescFczp6uaInJIR8F30u6m0d7bu/zsQ6xtCtWONfgKxp825GdcS2ZBO5D9Iqa6UGWoiqoY7X7Aj59i4=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Hawking.Zhang@amd.com; 
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
Cc: "Xiao, Jack" <Jack.Xiao@amd.com>, "Kuehling,
 Felix" <Felix.Kuehling@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SG93IGFib3V0IHB1dCBwY2lfZW5hYmxlX2F0b21pY19vcHNfdG9fcm9vdCBhaGVhZCBvZiBhbWRn
cHVfZGV2aWNlX2lwX2Vhcmx5X2luaXQsIHdoaWxlIG1vdmUgcGNpX2F0b21pY19yZXF1ZXN0ZWQg
ZnJvbSBrZmQgZGV2aWNlIHRvIGtnZCBkZXZpY2UgPyBJbiBzdWNoIHdheSwgd2UgY2FuIGF2b2lk
IGR1cGxpY2F0ZSBhdG9taWMgcmVxdWVzdCBmcm9tIGJvdGggYW1kZ3B1IGFuZCBhbWRrZmQuDQoN
ClJlZ2FyZHMsDQpIYXdraW5nDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogYW1k
LWdmeCA8YW1kLWdmeC1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9m
IFhpYW8sIEphY2sNClNlbnQ6IDIwMTnlubQ15pyIMjfml6UgMTg6MTkNClRvOiBhbWQtZ2Z4QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZw0KQ2M6IFhpYW8sIEphY2sgPEphY2suWGlhb0BhbWQuY29tPg0K
U3ViamVjdDogW1BBVENIXSBkcm0vYW1kZ3B1OiBlbmFibGUgUENJRSBhdG9taWNzIG9wcyBzdXBw
b3J0DQoNCkdQVSBhdG9taWNzIG9wZXJhdGlvbiBkZXBlbmRzIG9uIFBDSUUgYXRvbWljcyBzdXBw
b3J0Lg0KQWx3YXlzIGVuYWJsZSBQQ0lFIGF0b21pY3Mgb3BzIHN1cHBvcnQgaW4gY2FzZSB0aGF0
IGl0IGhhc24ndCBiZWVuIGVuYWJsZWQuDQoNClNpZ25lZC1vZmYtYnk6IEphY2sgWGlhbyA8SmFj
ay5YaWFvQGFtZC5jb20+DQotLS0NCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
ZGV2aWNlLmMgfCA3ICsrKysrKysNCiAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspDQoN
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMNCmluZGV4IGJkZDFm
ZTczLi5hMmM2MDY0IDEwMDY0NA0KLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X2RldmljZS5jDQorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2
aWNlLmMNCkBAIC0yNTYyLDYgKzI1NjIsMTMgQEAgaW50IGFtZGdwdV9kZXZpY2VfaW5pdChzdHJ1
Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwNCiAJaWYgKGFkZXYtPnJpb19tZW0gPT0gTlVMTCkNCiAJ
CURSTV9JTkZPKCJQQ0kgSS9PIEJBUiBpcyBub3QgZm91bmQuXG4iKTsNCiANCisJLyogZW5hYmxl
IFBDSUUgYXRvbWljIG9wcyAqLw0KKwlyID0gcGNpX2VuYWJsZV9hdG9taWNfb3BzX3RvX3Jvb3Qo
YWRldi0+cGRldiwNCisJCQkJUENJX0VYUF9ERVZDQVAyX0FUT01JQ19DT01QMzIgfA0KKwkJCQlQ
Q0lfRVhQX0RFVkNBUDJfQVRPTUlDX0NPTVA2NCk7DQorCWlmIChyKQ0KKwkJRFJNX0lORk8oIlBD
SUUgYXRvbWljIG9wcyBpcyBub3Qgc3VwcG9ydGVkXG4iKTsNCisNCiAJYW1kZ3B1X2RldmljZV9n
ZXRfcGNpZV9pbmZvKGFkZXYpOw0KIA0KIAkvKiBlYXJseSBpbml0IGZ1bmN0aW9ucyAqLw0KLS0N
CjEuOS4xDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
DQphbWQtZ2Z4IG1haWxpbmcgbGlzdA0KYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA0KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWls
aW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
