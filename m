Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D343AF4A9
	for <lists+amd-gfx@lfdr.de>; Wed, 11 Sep 2019 05:21:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5D9B6E9EB;
	Wed, 11 Sep 2019 03:21:11 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760087.outbound.protection.outlook.com [40.107.76.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 128D66E9EA
 for <amd-gfx@lists.freedesktop.org>; Wed, 11 Sep 2019 03:21:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NDg688Ec2tKcDlLktyNaXqK77MLElOCVfvQ6BvBUGvTNzoEroQHET98kxesvQ6bsg1hPjadqmz/l0Ycx0NBqD5MaGmcE0s1vLinv9O/mzp2Agvplo1YIIkMVZwRuJ850AhTPIFS/vkI4u0AmA+nNV5QVZjpAIQFibTkbWY5Q3/iPZaw6f9e8ueVyvFW0zbMxd2UaUXSjFFB8liZIdZICADYntkvPtYYR0m6m99xXSgzPd2jfd/wTjVOfzNr3dNy+QelS2soUW5Tmp7aifxSCSwQq22Ir4oXFhAEVZKHmocjfvTzhy9SiKopUrntYmgNaN12h9v85HqN1pt3gb4XY4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pe3P/S0eTR7ps4PV+5yQ2Nzo06AARZ3CuyXZq+KGyFw=;
 b=G9td6zQz95lOQLbN4hL+yCrsjqrxUh7FiWt+CejTB7i/4hO43gGLSgD8ftYTsF75z3zZPF/LeSdWN8CxQM13EtgRqB0b7MkW9p0sRKMnBFkvKnQDVbtcfEhrUtrirRb1q2Vf0GKQ+1dpykrVKbIco+Lx7xqDtXBU5If+PlYYu+d4JP1p1/o6zND1g9SOgHHWFTsmxbj5Afryo0W1rJeldHRraq02btE6Ef+XZLZKlKMF5VuQNRavLUcH4tWVWoKTTwbwRPvefH16CRGDR+QCZ1LSwEQa8so/Hhmvpvq4WhzvudR99Qu+pbAvXqw7bGjMLSiWNyNh8wELQaqH6P9gYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BYAPR12MB2806.namprd12.prod.outlook.com (20.176.254.20) by
 BYAPR12MB2726.namprd12.prod.outlook.com (20.177.124.145) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.15; Wed, 11 Sep 2019 03:21:08 +0000
Received: from BYAPR12MB2806.namprd12.prod.outlook.com
 ([fe80::c416:d75c:9f2f:9f11]) by BYAPR12MB2806.namprd12.prod.outlook.com
 ([fe80::c416:d75c:9f2f:9f11%7]) with mapi id 15.20.2241.018; Wed, 11 Sep 2019
 03:21:08 +0000
From: "Chen, Guchun" <Guchun.Chen@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Zhang,
 Hawking" <Hawking.Zhang@amd.com>, "Li, Dennis" <Dennis.Li@amd.com>, "Zhou1,
 Tao" <Tao.Zhou1@amd.com>, "Deucher, Alexander" <Alexander.Deucher@amd.com>
Subject: [PATCH 2/4] drm/amdgpu: support pcie bif ras query and inject
Thread-Topic: [PATCH 2/4] drm/amdgpu: support pcie bif ras query and inject
Thread-Index: AQHVaE/zSp3fo8ZnlkWqeITT3XVzLg==
Date: Wed, 11 Sep 2019 03:21:07 +0000
Message-ID: <20190911032016.10313-3-guchun.chen@amd.com>
References: <20190911032016.10313-1-guchun.chen@amd.com>
In-Reply-To: <20190911032016.10313-1-guchun.chen@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK2PR04CA0088.apcprd04.prod.outlook.com
 (2603:1096:202:15::32) To BYAPR12MB2806.namprd12.prod.outlook.com
 (2603:10b6:a03:70::20)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6270269b-68de-4946-171e-08d7366715ba
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BYAPR12MB2726; 
x-ms-traffictypediagnostic: BYAPR12MB2726:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB27260798754D57C529EBA257F1B10@BYAPR12MB2726.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:758;
x-forefront-prvs: 0157DEB61B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(376002)(366004)(346002)(136003)(39860400002)(199004)(189003)(102836004)(99286004)(66476007)(110136005)(316002)(54906003)(6436002)(11346002)(76176011)(26005)(305945005)(7736002)(446003)(6512007)(52116002)(36756003)(66946007)(71190400001)(71200400001)(86362001)(8936002)(5660300002)(81166006)(53936002)(81156014)(50226002)(8676002)(2501003)(1076003)(256004)(6116002)(14454004)(6506007)(6486002)(3846002)(2616005)(66556008)(386003)(486006)(25786009)(476003)(186003)(4326008)(66066001)(478600001)(66446008)(64756008)(6636002)(2906002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB2726;
 H:BYAPR12MB2806.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: xIgosH95jTncNkkOdeWGk/kYG24GUi89mWbZNsCrVW9Gn+IKdGo4VxAonVSWRpeB1iaiAbYQwLLI9OiVKiPS+3Si6bg0M38lM87ndIXgE/++03y0SQHPOMPYDSchAW9ZFZ7N1NIz/+5mudaveLAq2GysdXEQ5hgGScZnz2YxAZihyB1sJhLrgdxkwkgjOYb8jmwSFAYG4H62ZMoPebhXhrEZr6CzA6+QIiNuNhOHNZF08R1DnfWYP2vBUD240CeNly9d44WkyKu0bC7qvOTqFJgeXv10FJcN1dDxGPvL6zt6i/8OvNZgeflzLXYnx4w4SxI9GC0SILayz/qvUQicmb+LVmOoLounzpJlJamtaVENU9tJO63N61JPmQI/XdzAnSADwkWVHoxaROttTMhnbBEnw5Pg+7XTPQdeaTVtT08=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6270269b-68de-4946-171e-08d7366715ba
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2019 03:21:07.3081 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: f7hOpr3Qj2WcaXxIEWOZQfE43cCqOEIlzp/F1YCtjGxyvSlDUe6LVxm0YJ3KzdnPklbhaqn2PVVQ6e3gkB3lgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2726
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pe3P/S0eTR7ps4PV+5yQ2Nzo06AARZ3CuyXZq+KGyFw=;
 b=ZD+wPf0ovih6KNAyorVauk4CaC2ikp37yPc3Qn4bmcGmbfZjcsq+DGeepD5SLLwvqz2aUMLqEd7r/X9AI/B+0/4a0RHm0yhiY12lCvHsKVZLEjkIcr7SL6c/fvWfSlk845UuHfarrbXDrYw0u6fmL5RzryECjyhyIu0U27vs3jo=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Guchun.Chen@amd.com; 
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
Cc: "Zhou1, Tao" <Tao.Zhou1@amd.com>, "Li, Candice" <Candice.Li@amd.com>, "Chen,
 Guchun" <Guchun.Chen@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Q2FsbCBwY2llIGJpZiByYXMgcXVlcnkvaW5qZWN0IGluIGFtZGdwdSByYXMuCgpDaGFuZ2UtSWQ6
IElkZjUwMjFlZGYyMWU3MDQzMTQzMzhhYTJlOGIwNjcxZTRkNjIyZDFkClNpZ25lZC1vZmYtYnk6
IFRhbyBaaG91IDx0YW8uemhvdTFAYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogR3VjaHVuIENoZW4g
PGd1Y2h1bi5jaGVuQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X3Jhcy5jIHwgNSArKysrKwogMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKQoKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuYyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuYwppbmRleCA4NGNhMTNiOWQ0MmUuLjVm
MDZmMWU2NDVjNyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X3Jhcy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuYwpAQCAt
NjU0LDYgKzY1NCwxMCBAQCBpbnQgYW1kZ3B1X3Jhc19lcnJvcl9xdWVyeShzdHJ1Y3QgYW1kZ3B1
X2RldmljZSAqYWRldiwKIAkJaWYgKGFkZXYtPm1taHViX2Z1bmNzLT5xdWVyeV9yYXNfZXJyb3Jf
Y291bnQpCiAJCQlhZGV2LT5tbWh1Yl9mdW5jcy0+cXVlcnlfcmFzX2Vycm9yX2NvdW50KGFkZXYs
ICZlcnJfZGF0YSk7CiAJCWJyZWFrOworCWNhc2UgQU1ER1BVX1JBU19CTE9DS19fUENJRV9CSUY6
CisJCWlmIChhZGV2LT5uYmlvLmZ1bmNzLT5xdWVyeV9yYXNfZXJyb3JfY291bnQpCisJCQlhZGV2
LT5uYmlvLmZ1bmNzLT5xdWVyeV9yYXNfZXJyb3JfY291bnQoYWRldiwgJmVycl9kYXRhKTsKKwkJ
YnJlYWs7CiAJZGVmYXVsdDoKIAkJYnJlYWs7CiAJfQpAQCAtNzAzLDYgKzcwNyw3IEBAIGludCBh
bWRncHVfcmFzX2Vycm9yX2luamVjdChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKIAljYXNl
IEFNREdQVV9SQVNfQkxPQ0tfX1VNQzoKIAljYXNlIEFNREdQVV9SQVNfQkxPQ0tfX01NSFVCOgog
CWNhc2UgQU1ER1BVX1JBU19CTE9DS19fWEdNSV9XQUZMOgorCWNhc2UgQU1ER1BVX1JBU19CTE9D
S19fUENJRV9CSUY6CiAJCXJldCA9IHBzcF9yYXNfdHJpZ2dlcl9lcnJvcigmYWRldi0+cHNwLCAm
YmxvY2tfaW5mbyk7CiAJCWJyZWFrOwogCWRlZmF1bHQ6Ci0tIAoyLjE3LjEKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0
CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
