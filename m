Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7D48C0F80
	for <lists+amd-gfx@lfdr.de>; Sat, 28 Sep 2019 05:40:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74D5B6E048;
	Sat, 28 Sep 2019 03:40:28 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820083.outbound.protection.outlook.com [40.107.82.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C43FB6E048
 for <amd-gfx@lists.freedesktop.org>; Sat, 28 Sep 2019 03:40:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i7f4F25Y5vWG8z0apibOjyKZz9o8NY0N16ePoqrbeUJnOS93Vhx7kXoG6gCfwKDt3TFFvSugXTsjZhJ9aY8wj7tkMoqTIhK4QnMnqjTZDXolZSGzB56ZO4vjQN6BtaUJceUZSVg0WExyob0HSQWNwjt4ZcXbcmP5ZvzIWtH/pfVv+zLhXLbarf6AM8JYk03RT5mTC8mD/XVQqtgfc4xvVbyns191Cy9IBv8qVH/uiHvUT603e+k8heIvCU5K335BOVz3u0PQUzqinZcV6Fj5hZfOGIQh+T4i7jmWSy3YkCR7Dp6THyTVStFs71f5ZEOd6F4jTNI+1YtfrBMJ+Nz/8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fmuIfR+4QoXMPdnsf0Vv+M83Fcs8KtUGxyT61rl+Ctg=;
 b=cCQOh4OYoZUZBMQS1iE7kwCPrXD/ewT2rvJ503E+UiVo1AQzfBodegz/PMdXKS8NcdGYOohu+eISVEw0KCP2QrR1mWbhOLwW75rlCuV7ac7tuvT90OEfCQDP9CXwOQ5OXFl/TqdvXP8cdoskvCzU5Caskbmm1tqTc19z3Mkn87NujLYqswehwK9uQlKOFfVqmcEQDDmwXxrQvMjxc3mozd7UgL3o0fpolWFDA/Pstq0wbtN/cHDzUo8KGi5GRDfqRvHRu5A66bguyBim120oqoMrAlDbDQMOMGMRo8KVo1FQexPX+DJ3fYZTlNOeX4n2JwIb61KihQdu9paDXqvbug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM6PR12MB2778.namprd12.prod.outlook.com (20.176.114.145) by
 DM6PR12MB2809.namprd12.prod.outlook.com (20.176.117.82) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.18; Sat, 28 Sep 2019 03:40:25 +0000
Received: from DM6PR12MB2778.namprd12.prod.outlook.com
 ([fe80::81aa:9739:a2c2:12fa]) by DM6PR12MB2778.namprd12.prod.outlook.com
 ([fe80::81aa:9739:a2c2:12fa%4]) with mapi id 15.20.2284.028; Sat, 28 Sep 2019
 03:40:25 +0000
From: "Zhao, Yong" <Yong.Zhao@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amdgpu: Export setup_vm_pt_regs() logic for mmhub 2.0
Thread-Topic: [PATCH] drm/amdgpu: Export setup_vm_pt_regs() logic for mmhub 2.0
Thread-Index: AQHVda52BhoGjaZDq06LGLvHg8S08Q==
Date: Sat, 28 Sep 2019 03:40:25 +0000
Message-ID: <20190928034012.28228-1-Yong.Zhao@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YT1PR01CA0003.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::16)
 To DM6PR12MB2778.namprd12.prod.outlook.com
 (2603:10b6:5:50::17)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 45606b17-f462-4cfa-ca62-08d743c598d9
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: DM6PR12MB2809:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB2809EBC60E6823C2093E95F4F0800@DM6PR12MB2809.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:343;
x-forefront-prvs: 0174BD4BDA
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(376002)(396003)(39860400002)(136003)(346002)(199004)(189003)(6486002)(26005)(50226002)(2906002)(2351001)(6436002)(8936002)(5660300002)(186003)(7736002)(81166006)(256004)(102836004)(5640700003)(8676002)(6916009)(305945005)(66066001)(81156014)(3846002)(4326008)(25786009)(6116002)(71190400001)(71200400001)(2501003)(66446008)(6512007)(66556008)(66476007)(86362001)(2616005)(36756003)(1076003)(476003)(386003)(99286004)(478600001)(64756008)(6506007)(316002)(66946007)(14454004)(52116002)(486006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB2809;
 H:DM6PR12MB2778.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Avdy29jjlT4K4zDb129hYJntErTVLJqwajhAgR7b9idfhD8/qhISRKE3cMmMFhItcKNM0myVBJ5JAvzRAMOOI05Weq+S3j3BOMn35/1Lq0fuMfdR7E10DSCFOk5mDgJec5g2YiNNdT02+XhFkPcI4HoW1dQcFfOzuU7dsmwQvDD1W6aV0QcR6+E57QRvTcrJrlXFkOwtZWTzcYVWfJoCWdobf10WydZfvb3hIK+pAzQYZbBULmd/fGdfoTOlDMZvfgl9MlQAo/dO7gQ/cqj84Gxbk5v6efU/VqnWmwPJ1W7bBhukAndWYiRGqphJNpR49nu9HSonuhMuq0Mh7K6uKsnLF3DFu50aQ8lXmmhkAUSWcQPwBh8VpESEMNVoFmTOsMXRwDVJteXMAyFD+Hm2kBXIxXR4wih3i9VVVN8Kai0=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45606b17-f462-4cfa-ca62-08d743c598d9
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Sep 2019 03:40:25.1071 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IKV6SLwg45eLvSo4vjJ4r4g0OlY1kONoM8kfq1IUgkL6BkErzkGfNWpbwSNTC7/q
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2809
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fmuIfR+4QoXMPdnsf0Vv+M83Fcs8KtUGxyT61rl+Ctg=;
 b=UvOOpK3HwXzYzeSikifa8vAAkr+Dj6WD+/I9YskLO3sKz3P23cghHHbUy97gl1lHU4953zN+ozFwYI3oST6Xgoa+Xh5OukN6NKW8I/u1TGTBbIzuiXwlSDAaIts9KUeX6+CqeEXRvj3BzgOOjTrUxL5FQVK9PHyKVOM+AmFYEp0=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Yong.Zhao@amd.com; 
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
Cc: "Zhao, Yong" <Yong.Zhao@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhlIEtGRCBjb2RlIHdpbGwgY2FsbCB0aGlzIGZ1bmN0aW9uIGxhdGVyLgoKQ2hhbmdlLUlkOiBJ
NTk5MzMyMzYwMzc5OTk2M2U5ZWI0NzM4NTJiNmM3MmRlMjE3MmVkNgpTaWduZWQtb2ZmLWJ5OiBZ
b25nIFpoYW8gPFlvbmcuWmhhb0BhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L21taHViX3YyXzAuYyB8IDE5ICsrKysrKysrKysrKy0tLS0tLS0KIGRyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L21taHViX3YyXzAuaCB8ICAyICsrCiAyIGZpbGVzIGNoYW5nZWQsIDE0IGlu
c2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvbW1odWJfdjJfMC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvbW1o
dWJfdjJfMC5jCmluZGV4IDg2ZWQ4Y2I5MTVhOC4uMmVlYTcwMmRlOGVlIDEwMDY0NAotLS0gYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9tbWh1Yl92Ml8wLmMKKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvbW1odWJfdjJfMC5jCkBAIC0zMSwyMCArMzEsMjUgQEAKIAogI2luY2x1
ZGUgInNvYzE1X2NvbW1vbi5oIgogCi1zdGF0aWMgdm9pZCBtbWh1Yl92Ml8wX2luaXRfZ2FydF9w
dF9yZWdzKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQordm9pZCBtbWh1Yl92Ml8wX3NldHVw
X3ZtX3B0X3JlZ3Moc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsIHVpbnQzMl90IHZtaWQsCisJ
CQkJdWludDY0X3QgcGFnZV90YWJsZV9iYXNlKQogewotCXVpbnQ2NF90IHZhbHVlID0gYW1kZ3B1
X2dtY19wZF9hZGRyKGFkZXYtPmdhcnQuYm8pOworCS8qIHR3byByZWdpc3RlcnMgZGlzdGFuY2Ug
YmV0d2VlbiBtbU1NVk1fQ09OVEVYVDBfKiB0byBtbU1NVk1fQ09OVEVYVDFfKiAqLworCWludCBv
ZmZzZXQgPSBtbU1NVk1fQ09OVEVYVDFfUEFHRV9UQUJMRV9CQVNFX0FERFJfTE8zMgorCQkJLSBt
bU1NVk1fQ09OVEVYVDBfUEFHRV9UQUJMRV9CQVNFX0FERFJfTE8zMjsKIAotCVdSRUczMl9TT0Mx
NShNTUhVQiwgMCwgbW1NTVZNX0NPTlRFWFQwX1BBR0VfVEFCTEVfQkFTRV9BRERSX0xPMzIsCi0J
CSAgICAgbG93ZXJfMzJfYml0cyh2YWx1ZSkpOworCVdSRUczMl9TT0MxNV9PRkZTRVQoTU1IVUIs
IDAsIG1tTU1WTV9DT05URVhUMF9QQUdFX1RBQkxFX0JBU0VfQUREUl9MTzMyLAorCQkJb2Zmc2V0
ICogdm1pZCwgbG93ZXJfMzJfYml0cyhwYWdlX3RhYmxlX2Jhc2UpKTsKIAotCVdSRUczMl9TT0Mx
NShNTUhVQiwgMCwgbW1NTVZNX0NPTlRFWFQwX1BBR0VfVEFCTEVfQkFTRV9BRERSX0hJMzIsCi0J
CSAgICAgdXBwZXJfMzJfYml0cyh2YWx1ZSkpOworCVdSRUczMl9TT0MxNV9PRkZTRVQoTU1IVUIs
IDAsIG1tTU1WTV9DT05URVhUMF9QQUdFX1RBQkxFX0JBU0VfQUREUl9ISTMyLAorCQkJb2Zmc2V0
ICogdm1pZCwgdXBwZXJfMzJfYml0cyhwYWdlX3RhYmxlX2Jhc2UpKTsKIH0KIAogc3RhdGljIHZv
aWQgbW1odWJfdjJfMF9pbml0X2dhcnRfYXBlcnR1cmVfcmVncyhzdHJ1Y3QgYW1kZ3B1X2Rldmlj
ZSAqYWRldikKIHsKLQltbWh1Yl92Ml8wX2luaXRfZ2FydF9wdF9yZWdzKGFkZXYpOworCXVpbnQ2
NF90IHB0X2Jhc2UgPSBhbWRncHVfZ21jX3BkX2FkZHIoYWRldi0+Z2FydC5ibyk7CisKKwltbWh1
Yl92Ml8wX3NldHVwX3ZtX3B0X3JlZ3MoYWRldiwgMCwgcHRfYmFzZSk7CiAKIAlXUkVHMzJfU09D
MTUoTU1IVUIsIDAsIG1tTU1WTV9DT05URVhUMF9QQUdFX1RBQkxFX1NUQVJUX0FERFJfTE8zMiwK
IAkJICAgICAodTMyKShhZGV2LT5nbWMuZ2FydF9zdGFydCA+PiAxMikpOwpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvbW1odWJfdjJfMC5oIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvbW1odWJfdjJfMC5oCmluZGV4IGRiMTZmM2VjZTIxOC4uM2VhNDM0NGYwMzE1
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9tbWh1Yl92Ml8wLmgKKysr
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvbW1odWJfdjJfMC5oCkBAIC0zMSw1ICszMSw3
IEBAIHZvaWQgbW1odWJfdjJfMF9pbml0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KTsKIGlu
dCBtbWh1Yl92Ml8wX3NldF9jbG9ja2dhdGluZyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwK
IAkJCSAgICAgICBlbnVtIGFtZF9jbG9ja2dhdGluZ19zdGF0ZSBzdGF0ZSk7CiB2b2lkIG1taHVi
X3YyXzBfZ2V0X2Nsb2NrZ2F0aW5nKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LCB1MzIgKmZs
YWdzKTsKK3ZvaWQgbW1odWJfdjJfMF9zZXR1cF92bV9wdF9yZWdzKHN0cnVjdCBhbWRncHVfZGV2
aWNlICphZGV2LCB1aW50MzJfdCB2bWlkLAorCQkJCXVpbnQ2NF90IHBhZ2VfdGFibGVfYmFzZSk7
CiAKICNlbmRpZgotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ft
ZC1nZng=
