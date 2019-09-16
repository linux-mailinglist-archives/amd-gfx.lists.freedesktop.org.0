Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AE0A6B3308
	for <lists+amd-gfx@lfdr.de>; Mon, 16 Sep 2019 03:40:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 145826E093;
	Mon, 16 Sep 2019 01:40:29 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780040.outbound.protection.outlook.com [40.107.78.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DA976E093
 for <amd-gfx@lists.freedesktop.org>; Mon, 16 Sep 2019 01:40:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FIZEerBzHZZRAYYWlg7//FPiDjyv8J7W7hMZYuR/KQxzWAMO7pHWjEuhmTzhbcPcczm0TpjsZLi/I9q3X+y3WHePmVtFguwc6v6r2lZ4mYiJBav23oKF9qbxsPyMIBd/vXjt47In5ukWjOB7+MonEPD6Z3McSEn9yrnyMz6eEPzMxhygduLEE1GiJ36hWRVf20n2Pttz/4LSkWqs8rJlbYd0bY1gGoUH4VLAkTh3NH93xlDyMRhDYdOkv8e+CKxTSUQ8pLKcHG4P0GwbcwDNsPbSKlKB0E+fGIcjhZfFu/MB7FXeU3wFNDrpXbNzc1nJUJxP1Ob48OHQ2FTvyGur/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TiyShRQ2zTOJd1C9Oj/DQIE+h+dv+IiJprObeVvEtxg=;
 b=QUThnpkKlNIX3p/Wf6A1CMnlqnYKmCkgoq1OsDgEAPJxuRNiijyBMvb5JMhE3HvTw8Q2HB8p8yqZYa4yWh3WBO2b05d4oRJkxfXi6LKSstfsswFTWQCzG+Ua2Bt0EzfWf/J8ZsTLG5f7mB3/7uvJR+00sra/fWB5MNg5O+Q8NO5hF/2eyigN8rM3WugCUs9gzZBA20Tczw4UIBCucsNsllCs+rUrHmKvxHAqMXMmpiyOuBK2qFEdrgPlz8vy92qv/398AI5h+Stw536brodsIGwDtEId61MxJJYUioa0DgkV1zi1ujEbp2IVcnoe+EBtJ1ewaxd81PYknELKhHvZlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3838.namprd12.prod.outlook.com (10.255.237.95) by
 MN2PR12MB3598.namprd12.prod.outlook.com (20.178.244.84) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.15; Mon, 16 Sep 2019 01:40:25 +0000
Received: from MN2PR12MB3838.namprd12.prod.outlook.com
 ([fe80::a056:2e67:6f45:31a]) by MN2PR12MB3838.namprd12.prod.outlook.com
 ([fe80::a056:2e67:6f45:31a%5]) with mapi id 15.20.2263.021; Mon, 16 Sep 2019
 01:40:25 +0000
From: "Liu, Aaron" <Aaron.Liu@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amdgpu: remove program of lbpw for renoir
Thread-Topic: [PATCH] drm/amdgpu: remove program of lbpw for renoir
Thread-Index: AQHVbC+2fwzT4dRYr0674BFnUu5jFg==
Date: Mon, 16 Sep 2019 01:40:25 +0000
Message-ID: <1568598006-13573-1-git-send-email-aaron.liu@amd.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK0PR03CA0043.apcprd03.prod.outlook.com
 (2603:1096:203:2f::31) To MN2PR12MB3838.namprd12.prod.outlook.com
 (2603:10b6:208:166::31)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.7.4
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0cd3d083-978c-44db-ac6c-08d73a46d85b
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MN2PR12MB3598; 
x-ms-traffictypediagnostic: MN2PR12MB3598:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB35989391ACDFE1624B1F5B8EF08C0@MN2PR12MB3598.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1850;
x-forefront-prvs: 0162ACCC24
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(396003)(346002)(366004)(136003)(39860400002)(189003)(199004)(6486002)(99286004)(52116002)(66946007)(6436002)(8936002)(4744005)(50226002)(81166006)(81156014)(8676002)(66446008)(6916009)(6512007)(53936002)(478600001)(5640700003)(66476007)(2351001)(4326008)(316002)(256004)(71190400001)(71200400001)(25786009)(36756003)(486006)(2501003)(64756008)(66556008)(5660300002)(7736002)(386003)(2906002)(6506007)(305945005)(102836004)(14454004)(86362001)(66066001)(186003)(26005)(54906003)(3846002)(6116002)(2616005)(476003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3598;
 H:MN2PR12MB3838.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: IRFz1RYEuY6+13eOTTxUKFMs9uNWZOxlwOQ+OdH0gZi89Bb8Mu8mGGLjqE24LTy5tehJ6KCzw0CyBFm1V/GKIizRSKfniJBCJzPEHsWXKEy6H8MIM6XlWf+OEx/nzGvI3cRmA6DgFn8kq+Yznka8LOQ4UxGoC5I8IUAzGVZNEyq5DpoI13rE242q9cxJxHLcF1BHV+kY3E85Dj5Ih5eUymj86C5JsTzhM7uOYiIT1XJT3wq+Q9+tFACCot+PazX6sneQtP+nNGki2dkVMWZSNbMM8tA3Vbr+u8R4hrOzvFGdeV0mUU+aDvMfcM2ckbiV6eIFvXjtDgfV6o6XSge0ptAK89hGSIhTk7CEphVVHZDQGNyPfgGo/lwudLsWlsuGyyjp0jJWAoiTlgHmgQH82QL2LfjXu0e58tQGDxRYq3Y=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cd3d083-978c-44db-ac6c-08d73a46d85b
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Sep 2019 01:40:25.2060 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KXONJDKOx+5Rh5JooBPkOCJ7aUukJ5Ws8GZk19M7GaPqlmXp+JstrY1S0aQBuGW9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3598
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TiyShRQ2zTOJd1C9Oj/DQIE+h+dv+IiJprObeVvEtxg=;
 b=mig6w6J/cRz1Y/EF+E0fmzjSx7ApKXVQDCOcgS08CpZ/7pwiIX4MXOCok/b7P3LjNWDcMx3GumsoXq6mfBx+wNjWgKw+yLnX+llhlA9bTGF9Tp5bIwZwTJfqmsMKfgJrjfLkWfWVU0OQmo1wqJY8jwVJzzukyJEtqJtsXyno//s=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Aaron.Liu@amd.com; 
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Huang,
 Ray" <Ray.Huang@amd.com>, "Liu, Aaron" <Aaron.Liu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhlc2UgaXMgbm8gTEJQVyBvbiBSZW5vaXIuIFNvIHJlbW92aW5nIHByb2dyYW0gb2YgbGJwdyBm
b3IgcmVub2lyLgoKU2lnbmVkLW9mZi1ieTogQWFyb24gTGl1IDxhYXJvbi5saXVAYW1kLmNvbT4K
LS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjlfMC5jIHwgMiAtLQogMSBmaWxl
IGNoYW5nZWQsIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvZ2Z4X3Y5XzAuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92OV8w
LmMKaW5kZXggYjc1ZWY4OS4uZmUyMWVmOCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvZ2Z4X3Y5XzAuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhf
djlfMC5jCkBAIC0xNjQ2LDcgKzE2NDYsNiBAQCBzdGF0aWMgaW50IGdmeF92OV8wX3JsY19pbml0
KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQogCiAJc3dpdGNoIChhZGV2LT5hc2ljX3R5cGUp
IHsKIAljYXNlIENISVBfUkFWRU46Ci0JY2FzZSBDSElQX1JFTk9JUjoKIAkJZ2Z4X3Y5XzBfaW5p
dF9sYnB3KGFkZXYpOwogCQlicmVhazsKIAljYXNlIENISVBfVkVHQTIwOgpAQCAtMzAxMyw3ICsz
MDEyLDYgQEAgc3RhdGljIGludCBnZnhfdjlfMF9ybGNfcmVzdW1lKHN0cnVjdCBhbWRncHVfZGV2
aWNlICphZGV2KQogCiAJc3dpdGNoIChhZGV2LT5hc2ljX3R5cGUpIHsKIAljYXNlIENISVBfUkFW
RU46Ci0JY2FzZSBDSElQX1JFTk9JUjoKIAkJaWYgKGFtZGdwdV9sYnB3ID09IDApCiAJCQlnZnhf
djlfMF9lbmFibGVfbGJwdyhhZGV2LCBmYWxzZSk7CiAJCWVsc2UKLS0gCjIuNy40CgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcg
bGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
