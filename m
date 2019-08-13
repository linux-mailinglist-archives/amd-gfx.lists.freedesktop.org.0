Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA1BF8B364
	for <lists+amd-gfx@lfdr.de>; Tue, 13 Aug 2019 11:08:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09B936E0B6;
	Tue, 13 Aug 2019 09:08:24 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760073.outbound.protection.outlook.com [40.107.76.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE89C6E0B6
 for <amd-gfx@lists.freedesktop.org>; Tue, 13 Aug 2019 09:08:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OvQMMVpTJlZn4+noRPhpXdKw4AixrywCy2hFvvALzhW+ziBohBnjkcLuU7pMES4xD3ym3ZqMCXgkm+MiOMxXYMBIvp/CSyFhwJlCuKSHOK9t4QLI/bEovBnbU+yS0ReEwiaXyFAiMzzeOC52fy+i/xm0m0irTIRbsu/Is2nER+J78f+uPtYZoloJJMxqYuNBIe1syQ2wDLy/vZ5KnxqEMbeiUBiSH2a5LkuSimzryN4hlpC9JIu7HNoRemgz6DMxi84//+iih+LCzPob5A5u8XMizgvER8rAlDTG03b/+d/pQZ46Benw4NMgHrbA6k7l+c+5whzn+VMxvHVCsOQC2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SIzCw4qx1SqQSrEUQRtw8yLF4vRE6sesMHPzukbMQlI=;
 b=SHazAEzjjrBu0/QZwvjPkVS48wHb1Jjm/B4margvarHL7Hk3Bu1xJu9pH14QxvPhQrKKzMGMAqprSxytfOU8ENJJnHb6nNny2M9m08u0ChOVWnSQsqdi0cZPg8OakeWZVExTodXyR5MICI97Hf7h17nLl/dz+Wv/ODr88ecUa2jdiMh7IKyyUZlahEIcWIZL2LKWnDh1QEjd5Gc3+15/s6GUwle4wTUf0In+MU3ISY+24aZyq0mIBAf3VkoBuLw0yuizpbcVNRmy+TDikGrlvZ3nTqQ4gUgC5SvjaK6n1rjnr46t7j0P0unRJwnUJBpKRlPHJXpR1hd1Fw4+k4pZBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3296.namprd12.prod.outlook.com (20.179.80.139) by
 MN2PR12MB4125.namprd12.prod.outlook.com (52.135.50.9) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.18; Tue, 13 Aug 2019 09:08:21 +0000
Received: from MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::7490:549a:479d:f716]) by MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::7490:549a:479d:f716%6]) with mapi id 15.20.2157.022; Tue, 13 Aug 2019
 09:08:21 +0000
From: "Wang, Kevin(Yang)" <Kevin1.Wang@amd.com>
To: dl.srdc_lnx_nv10 <dl.srdc_lnx_nv10@amd.com>
Subject: [PATCH 2/2] drm/amdgpu: use exiting amdgput_ctx_total_num_entities
 function
Thread-Topic: [PATCH 2/2] drm/amdgpu: use exiting
 amdgput_ctx_total_num_entities function
Thread-Index: AQHVUbanb/ue783GoEOUuX72LTt1Ag==
Date: Tue, 13 Aug 2019 09:08:21 +0000
Message-ID: <20190813090745.9496-2-kevin1.wang@amd.com>
References: <20190813090745.9496-1-kevin1.wang@amd.com>
In-Reply-To: <20190813090745.9496-1-kevin1.wang@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK0P153CA0044.APCP153.PROD.OUTLOOK.COM
 (2603:1096:203:17::32) To MN2PR12MB3296.namprd12.prod.outlook.com
 (2603:10b6:208:aa::11)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.22.0
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: dcf2b7af-bc56-4473-3d17-08d71fcdc9cf
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MN2PR12MB4125; 
x-ms-traffictypediagnostic: MN2PR12MB4125:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB4125C8BD0E8798DC231A6B29A2D20@MN2PR12MB4125.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:60;
x-forefront-prvs: 01283822F8
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(346002)(39860400002)(136003)(376002)(396003)(199004)(189003)(6636002)(4326008)(316002)(52116002)(26005)(5660300002)(76176011)(6486002)(99286004)(8936002)(102836004)(6862004)(8676002)(86362001)(54906003)(6512007)(50226002)(386003)(6506007)(14454004)(81166006)(81156014)(486006)(11346002)(186003)(446003)(4744005)(7736002)(2616005)(25786009)(53936002)(1076003)(256004)(36756003)(305945005)(71190400001)(478600001)(476003)(6116002)(2906002)(66446008)(66476007)(66946007)(6436002)(37006003)(64756008)(66556008)(3846002)(66066001)(71200400001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB4125;
 H:MN2PR12MB3296.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ddaQ/9ZHf+TZsoG0wfZIIKTRi7jq1zr7bjT5w8q6IFY478l9KKqcPs2f54Q499S1NyM0QFaXVlOYB3Uhrpjp0D24Xu5KodkNsZCFff9PjMZ6ba6StK2BWl5giB778ny0R3Xc5qFUWfG787wEFprBKv5jA/2nC5282vlvyY0WPCPSZoQvdMzBdya+JkUpjDcNJyz/6iGR8PyfmCBTFSyW5xMwf3dvWL2kLOMZGxjCoV/QmHMznC40AGaBBG3XVO/RyVCEldWSL0HUugAeIdrW54ocOyoaIaXeqmQc3XMUvu0Z4zNaYb1x9vINcV2H6lZ36RWm8m866705JqfEM4zAji1DhH//5bPkucvmplm68XpWiSEHEStc0KwRJvlYbedDwa6PMzVr2cD2s+qWaiqfkvbp5sIA4Ok1KCKzlKQzutg=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dcf2b7af-bc56-4473-3d17-08d71fcdc9cf
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Aug 2019 09:08:21.4361 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8WXKGsyTGiQljExC/intKNS2lfsg/z3205hxq+Iy+NCAiIll6uqxq7+yAUFYIWLL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4125
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SIzCw4qx1SqQSrEUQRtw8yLF4vRE6sesMHPzukbMQlI=;
 b=dAUjyo+gbjqnaDr9wcpI/iMUmNWznOBKR6mZ5234nEBAWzRLufH4I33BGAg8pi7J9RzBrG6R2pGsiHi4mo+qU1tkA4WCVnTHFHrxaAtxHcb/DMTzPfdcd4d2R/SrydAZzHaOb9g21q/G08NUUuK2FQYd4XZV2NGsgL2J347ldU0=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Kevin1.Wang@amd.com; 
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
Cc: "Wang, Kevin\(Yang\)" <Kevin1.Wang@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

c2ltcGxpZnkgZHJpdmVyIGNvZGUuCgpTaWduZWQtb2ZmLWJ5OiBLZXZpbiBXYW5nIDxrZXZpbjEu
d2FuZ0BhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9jdHgu
YyB8IDUgKy0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgNCBkZWxldGlvbnMo
LSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfY3R4LmMg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfY3R4LmMKaW5kZXggOTVkODIwMWE3
MzhlLi44OWMyNmJiMGYwNWMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV9jdHguYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfY3R4
LmMKQEAgLTI5MCwxMCArMjkwLDcgQEAgc3RhdGljIHZvaWQgYW1kZ3B1X2N0eF9kb19yZWxlYXNl
KHN0cnVjdCBrcmVmICpyZWYpCiAKIAljdHggPSBjb250YWluZXJfb2YocmVmLCBzdHJ1Y3QgYW1k
Z3B1X2N0eCwgcmVmY291bnQpOwogCi0JbnVtX2VudGl0aWVzID0gMDsKLQlmb3IgKGkgPSAwOyBp
IDwgQU1ER1BVX0hXX0lQX05VTTsgaSsrKQotCQludW1fZW50aXRpZXMgKz0gYW1kZ3B1X2N0eF9u
dW1fZW50aXRpZXNbaV07Ci0KKwludW1fZW50aXRpZXMgPSBhbWRncHVfY3R4X3RvdGFsX251bV9l
bnRpdGllcygpOwogCWZvciAoaSA9IDA7IGkgPCBudW1fZW50aXRpZXM7IGkrKykKIAkJZHJtX3Nj
aGVkX2VudGl0eV9kZXN0cm95KCZjdHgtPmVudGl0aWVzWzBdW2ldLmVudGl0eSk7CiAKLS0gCjIu
MjIuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1k
LWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
