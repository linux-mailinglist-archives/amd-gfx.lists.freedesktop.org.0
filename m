Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DBE3B3FFC
	for <lists+amd-gfx@lfdr.de>; Mon, 16 Sep 2019 20:05:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3CDD6EA1C;
	Mon, 16 Sep 2019 18:05:56 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690083.outbound.protection.outlook.com [40.107.69.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E54686EA1B
 for <amd-gfx@lists.freedesktop.org>; Mon, 16 Sep 2019 18:05:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZfBQPdt7OmR+HaUYOBEO8XXQRcRo4x9hEM+vFBQvCMFXb7ANq/KIr6SidNB7+biBCbCcWnwbMWgD5BFmOz9oDwZaCHf/xrirsE8I0CC/VS0IO2WYDm2E0SuJMXmw7ozFjQ9t/CpfaO/YaBEuDRkpXIoHbUX2A9HbqGXCYFnHW4dgLGQnIlYCm+OvLEewzlCxEUZIfsEd52ri3QJDigu5UxeaQgRcxmiFHb2pY3qnc+a/zaEMXfa5MVRuBQpmHd471JeQzuisb4VJnaneD7ieafvCdZKkWwK+wUpTZ/czp0nbt9mbQ4ldZHkGtKnSi88nPum0had6eABalICYEBhHuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fajRHZR9Uxxlavl7AQXFoyVQ0HAJI/LR9jwmOtqirTE=;
 b=lOuDemmqkhxK3cdyWkzZo5uKKZqJ0qVz8uEAfePGJsuUZQ196qqQaFXFifO82QeUhWp4iODVZ4+AFDBX3AFI3IucgfBI57IaF62rSTUevWW+x42A9J5YHgi0Ci9fkbHL40XssGqGMlrfzfBQefvTuFHnIZTlQtmQFM/aSuO78tJ2bbdptur8JZk9kveLsPIMeeENRm8B2SVvsc3B5BMuCZhpAcYkHiE8BTXPD4CTJjoc6ZaKUITnLk4N1VaC63J6WLkycpUvRi7F4TJ9O2Pefjjs/NuODL7ZxoxhjgzyNEV6yJZOOnXix1w5Rpskn4RtCtzOY3imtGncdLWoSjSIqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB2911.namprd12.prod.outlook.com (20.179.80.85) by
 MN2PR12MB3871.namprd12.prod.outlook.com (10.255.237.208) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.15; Mon, 16 Sep 2019 18:05:53 +0000
Received: from MN2PR12MB2911.namprd12.prod.outlook.com
 ([fe80::c8cf:fab8:48c1:8cee]) by MN2PR12MB2911.namprd12.prod.outlook.com
 ([fe80::c8cf:fab8:48c1:8cee%7]) with mapi id 15.20.2263.023; Mon, 16 Sep 2019
 18:05:53 +0000
From: "Kasiviswanathan, Harish" <Harish.Kasiviswanathan@amd.com>
To: "tj@kernel.org" <tj@kernel.org>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>, "airlied@redhat.com" <airlied@redhat.com>
Subject: [PATCH v2 1/4] drm/amdkfd: Store kfd_dev in iolink and cache
 properties
Thread-Topic: [PATCH v2 1/4] drm/amdkfd: Store kfd_dev in iolink and cache
 properties
Thread-Index: AQHVbLlhJ3vLLBE/zUS3ZBbJUPNIGQ==
Date: Mon, 16 Sep 2019 18:05:53 +0000
Message-ID: <20190916180523.27341-2-Harish.Kasiviswanathan@amd.com>
References: <20190916180523.27341-1-Harish.Kasiviswanathan@amd.com>
In-Reply-To: <20190916180523.27341-1-Harish.Kasiviswanathan@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
x-clientproxiedby: YTBPR01CA0008.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::21) To MN2PR12MB2911.namprd12.prod.outlook.com
 (2603:10b6:208:a9::21)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b83dfb1f-3631-4d02-ca6d-08d73ad083be
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3871; 
x-ms-traffictypediagnostic: MN2PR12MB3871:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB3871C46F633A00E1E90D0AD38C8C0@MN2PR12MB3871.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2000;
x-forefront-prvs: 0162ACCC24
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(396003)(366004)(39860400002)(376002)(136003)(199004)(189003)(50226002)(5660300002)(2906002)(486006)(76176011)(53936002)(36756003)(66946007)(6512007)(1076003)(66556008)(66476007)(64756008)(52116002)(81156014)(8676002)(66446008)(6436002)(14454004)(86362001)(478600001)(446003)(11346002)(81166006)(71190400001)(2501003)(2616005)(4326008)(476003)(71200400001)(25786009)(3846002)(14444005)(8936002)(6486002)(6116002)(256004)(54906003)(110136005)(99286004)(6506007)(66066001)(7736002)(386003)(305945005)(26005)(186003)(316002)(102836004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3871;
 H:MN2PR12MB2911.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: YRRwoZRV4eWU+iS4GLWRWB3aHoOTnl3t3KBepzRe0bLMiPchxraY+v2ciUytL66dp4JXecG5c3li2KcSAcLwyap/x4mPY6YHEagIzpwoZcZY0Xm5l8P5e3FauUc2k8YviC3w0g9t+Rz7tq1lJkZyzn5KCQmJJ1u9jEry+jeGDhv0M+Oag3CQLVUEppBfwBJCjCXe19TSRgEfmb18mvQOVRS23s6muERWBCqJAJFjEYC/JZNjJG6+iSuHbp4dROMJ+SDYmyuo7+8OFq5Dp3gLeBiDHVE6jKYgZHvsDClWGvo7Pcui2kcptVxuP6GyZHIdo8kGvrPrWSIEPBagorvflSe9WCEv6ZYEncB9p/QjcPHrPslcZmPHt0mGLGrKMT2AkNAFRP+5n7pk91dY63sX4/fgqEGR3WGpNPd/y89i8W8=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b83dfb1f-3631-4d02-ca6d-08d73ad083be
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Sep 2019 18:05:53.6860 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Kd+bo5Crelok+tnblNwmZLnQv0WfAMMrkQInyL9epI2lk+1vdZ/4/W502tBAGSC2Zjp3w4Cr0V0bobPuzr3ueA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3871
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fajRHZR9Uxxlavl7AQXFoyVQ0HAJI/LR9jwmOtqirTE=;
 b=1bkjun6iOCaDGfyce5pjyvd0jWk31H9nQTr5qmZG7/9ea0p7Y1nIcSA7l6H4rxvRlHEP6GucrUmpW55Dm7Xyx4i+xMGnY8rxoyTtkJyL3G/cZqo+8fAWRvgkIr9t7BLEXZ7DhZsKepfBeEVJptCANkqQQfBFEgUi3iXyOl5fpTw=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Harish.Kasiviswanathan@amd.com; 
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
Cc: "cgroups@vger.kernel.org" <cgroups@vger.kernel.org>, "Kasiviswanathan,
 Harish" <Harish.Kasiviswanathan@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhpcyBpcyByZXF1aXJlZCB0byBjaGVjayBhZ2FpbnN0IGNncm91cCBwZXJtaXNzaW9ucy4KClNp
Z25lZC1vZmYtYnk6IEhhcmlzaCBLYXNpdmlzd2FuYXRoYW4gPEhhcmlzaC5LYXNpdmlzd2FuYXRo
YW5AYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IEZlbGl4IEt1ZWhsaW5nIDxGZWxpeC5LdWVobGluZ0Bh
bWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF90b3BvbG9neS5jIHwg
MTAgKysrKysrKysrKwogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX3RvcG9sb2d5Lmgg
fCAgMyArKysKIDIgZmlsZXMgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF90b3BvbG9neS5jIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRrZmQva2ZkX3RvcG9sb2d5LmMKaW5kZXggZjIxNzBmMGU0MzM0Li44ZDBjZmQz
OTFkNjcgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF90b3BvbG9n
eS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF90b3BvbG9neS5jCkBAIC0x
MDk4LDYgKzEwOTgsOSBAQCBzdGF0aWMgc3RydWN0IGtmZF90b3BvbG9neV9kZXZpY2UgKmtmZF9h
c3NpZ25fZ3B1KHN0cnVjdCBrZmRfZGV2ICpncHUpCiB7CiAJc3RydWN0IGtmZF90b3BvbG9neV9k
ZXZpY2UgKmRldjsKIAlzdHJ1Y3Qga2ZkX3RvcG9sb2d5X2RldmljZSAqb3V0X2RldiA9IE5VTEw7
CisJc3RydWN0IGtmZF9tZW1fcHJvcGVydGllcyAqbWVtOworCXN0cnVjdCBrZmRfY2FjaGVfcHJv
cGVydGllcyAqY2FjaGU7CisJc3RydWN0IGtmZF9pb2xpbmtfcHJvcGVydGllcyAqaW9saW5rOwog
CiAJZG93bl93cml0ZSgmdG9wb2xvZ3lfbG9jayk7CiAJbGlzdF9mb3JfZWFjaF9lbnRyeShkZXYs
ICZ0b3BvbG9neV9kZXZpY2VfbGlzdCwgbGlzdCkgewpAQCAtMTExMSw2ICsxMTE0LDEzIEBAIHN0
YXRpYyBzdHJ1Y3Qga2ZkX3RvcG9sb2d5X2RldmljZSAqa2ZkX2Fzc2lnbl9ncHUoc3RydWN0IGtm
ZF9kZXYgKmdwdSkKIAkJaWYgKCFkZXYtPmdwdSAmJiAoZGV2LT5ub2RlX3Byb3BzLnNpbWRfY291
bnQgPiAwKSkgewogCQkJZGV2LT5ncHUgPSBncHU7CiAJCQlvdXRfZGV2ID0gZGV2OworCisJCQls
aXN0X2Zvcl9lYWNoX2VudHJ5KG1lbSwgJmRldi0+bWVtX3Byb3BzLCBsaXN0KQorCQkJCW1lbS0+
Z3B1ID0gZGV2LT5ncHU7CisJCQlsaXN0X2Zvcl9lYWNoX2VudHJ5KGNhY2hlLCAmZGV2LT5jYWNo
ZV9wcm9wcywgbGlzdCkKKwkJCQljYWNoZS0+Z3B1ID0gZGV2LT5ncHU7CisJCQlsaXN0X2Zvcl9l
YWNoX2VudHJ5KGlvbGluaywgJmRldi0+aW9fbGlua19wcm9wcywgbGlzdCkKKwkJCQlpb2xpbmst
PmdwdSA9IGRldi0+Z3B1OwogCQkJYnJlYWs7CiAJCX0KIAl9CmRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfdG9wb2xvZ3kuaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1ka2ZkL2tmZF90b3BvbG9neS5oCmluZGV4IGQ0NzE4ZDU4ZDBmMi4uMTU4NDNlMGZjNzU2IDEw
MDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfdG9wb2xvZ3kuaAorKysg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfdG9wb2xvZ3kuaApAQCAtMTAyLDYgKzEw
Miw3IEBAIHN0cnVjdCBrZmRfbWVtX3Byb3BlcnRpZXMgewogCXVpbnQzMl90CQlmbGFnczsKIAl1
aW50MzJfdAkJd2lkdGg7CiAJdWludDMyX3QJCW1lbV9jbGtfbWF4OworCXN0cnVjdCBrZmRfZGV2
CQkqZ3B1OwogCXN0cnVjdCBrb2JqZWN0CQkqa29iajsKIAlzdHJ1Y3QgYXR0cmlidXRlCWF0dHI7
CiB9OwpAQCAtMTIzLDYgKzEyNCw3IEBAIHN0cnVjdCBrZmRfY2FjaGVfcHJvcGVydGllcyB7CiAJ
dWludDMyX3QJCWNhY2hlX2xhdGVuY3k7CiAJdWludDMyX3QJCWNhY2hlX3R5cGU7CiAJdWludDhf
dAkJCXNpYmxpbmdfbWFwW0NSQVRfU0lCTElOR01BUF9TSVpFXTsKKwlzdHJ1Y3Qga2ZkX2RldgkJ
KmdwdTsKIAlzdHJ1Y3Qga29iamVjdAkJKmtvYmo7CiAJc3RydWN0IGF0dHJpYnV0ZQlhdHRyOwog
fTsKQEAgLTE0MSw2ICsxNDMsNyBAQCBzdHJ1Y3Qga2ZkX2lvbGlua19wcm9wZXJ0aWVzIHsKIAl1
aW50MzJfdAkJbWF4X2JhbmR3aWR0aDsKIAl1aW50MzJfdAkJcmVjX3RyYW5zZmVyX3NpemU7CiAJ
dWludDMyX3QJCWZsYWdzOworCXN0cnVjdCBrZmRfZGV2CQkqZ3B1OwogCXN0cnVjdCBrb2JqZWN0
CQkqa29iajsKIAlzdHJ1Y3QgYXR0cmlidXRlCWF0dHI7CiB9OwotLSAKMi4xNy4xCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcg
bGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
