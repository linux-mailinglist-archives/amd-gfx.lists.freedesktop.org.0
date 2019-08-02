Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6417C7EAA6
	for <lists+amd-gfx@lfdr.de>; Fri,  2 Aug 2019 05:22:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B1DC6E88E;
	Fri,  2 Aug 2019 03:22:07 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750049.outbound.protection.outlook.com [40.107.75.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 653A86E888
 for <amd-gfx@lists.freedesktop.org>; Fri,  2 Aug 2019 03:04:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WMccPhIGX1wkqQvwykWWI78cji/OFe7PGVEACkghXV80rma4sSyQJSYRKJN6yTXVkFKQZt2xPI0t4lfjJ7dND4CnRcXXhM3RHIE2NetWk9YUVxNo2fkbCz6CBFsyJaN3/xfinQpDf+B3Yr7uhK1YkrkYIXhVtdcMY1u0aoxRjQWZXV78lIJmhRdcF59Sd0XVt2jo4yLw7uJBzrm4m458BtQaNV1ulO6lsEcTjdZxvPXJEBb1UqQ2AohmFrUMjpvCzkx20PCqfXMo5yyasGtq4sOVjJc4lsOP5Gm9vdRr6KbXV4l2pcucrDS1Pwe80tbJr0QZItnqVXWqSgsIW6Vh0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4yIbA/zTqfdpYw68EiZFn5BgEC8/zG8WjgD19iwn+6I=;
 b=d5q6ND/A+bJO8d5vSoC/+aOXyhOu4jwtT2N0lqYlL48eEysNoKzz9mtQiIkSfMQuS8xxja9JawSruGaulRM+0+pYTzxJApJTVnPcHV8VgnnyIqP2AZ/pEXb2xwmIECEPzP/+jsg57gVxsKAnOwxBTYCVJ6KPMhwu1bxxHnINKkNwc8OVys9CMAHVapT3NxF6Qc6p8+POJmmv33MehFbzNpYsgPKYkbeGaTEJsdH/e7yVBQQ/jpVwie6op4RFiojHp1cvWquv0wupYJao5P9rYXeMKR6UM3Avq8g7QG7rBSC7mGIs8suSh11qs8T3XozgqiUhHDSHSzcSe80Qhv1t4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from DM6PR12MB2778.namprd12.prod.outlook.com (20.176.114.145) by
 DM6PR12MB3948.namprd12.prod.outlook.com (10.255.174.157) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.16; Fri, 2 Aug 2019 03:04:05 +0000
Received: from DM6PR12MB2778.namprd12.prod.outlook.com
 ([fe80::448a:9fc:743d:49cb]) by DM6PR12MB2778.namprd12.prod.outlook.com
 ([fe80::448a:9fc:743d:49cb%7]) with mapi id 15.20.2136.010; Fri, 2 Aug 2019
 03:04:05 +0000
From: "Zhao, Yong" <Yong.Zhao@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 brahma_sw_dev <brahma_sw_dev@amd.com>
Subject: [PATCH 1/2] drm/amdkfd: Delete the VF device info usage
Thread-Topic: [PATCH 1/2] drm/amdkfd: Delete the VF device info usage
Thread-Index: AQHVSN7xbZKOxRcR50uebQI9e6LIJA==
Date: Fri, 2 Aug 2019 03:04:04 +0000
Message-ID: <20190802030343.28529-1-Yong.Zhao@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YT1PR01CA0008.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::21)
 To DM6PR12MB2778.namprd12.prod.outlook.com
 (2603:10b6:5:50::17)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f4156494-aa2e-4a44-8650-08d716f613e6
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:DM6PR12MB3948; 
x-ms-traffictypediagnostic: DM6PR12MB3948:
x-ld-processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
x-microsoft-antispam-prvs: <DM6PR12MB394868FBC61875FDC3A5CD19F0D90@DM6PR12MB3948.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2657;
x-forefront-prvs: 011787B9DD
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(136003)(396003)(39860400002)(376002)(366004)(199004)(189003)(66476007)(4326008)(14454004)(50226002)(8936002)(305945005)(6436002)(81166006)(53936002)(6486002)(7736002)(256004)(81156014)(6512007)(25786009)(110136005)(186003)(1076003)(26005)(8676002)(316002)(71200400001)(99286004)(2501003)(5660300002)(102836004)(386003)(6506007)(6116002)(86362001)(3846002)(52116002)(66066001)(478600001)(71190400001)(2906002)(68736007)(36756003)(486006)(2616005)(66556008)(64756008)(66446008)(476003)(6636002)(66946007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3948;
 H:DM6PR12MB2778.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: b+CvDz6cILF+1V9UcUeYR0Y/yO3KcomCwHmZ3TfrhX75gCYJXuJMD4/aU18uEjW94SRUsQNsWC6lmkA+AbM0D4fAg1qVBGI0dNPvdzHS7TbNTzRV72umKB5qaaOioMwlVtAl9KDtmUCrY4VYzynqQiI4bJ9NV8Sed1jU3CFUekuU+S4NzihIvFqcRvNBwADsxYz6+fYqdIotqm1hbRUsQ3gUbxyu7OTlwXYcM/3ttE2EXI9SytMSONaAhyqcDM9S+AW9/1ZxVGwVln/uOOT4w9qcrgZLTbaArJepcdKCBVmvUjZhdPwfahHB/KZoOgnLD41XgRfWI1NW/NqjaXoDNej80PwYaGj2W4rdY0ZWvkDFn0/6A9D+t/bRAOfh0kuWvQweVPZC7KIS9CDJgfS7iXA32GFgbjZtIPe+k9L9aWA=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4156494-aa2e-4a44-8650-08d716f613e6
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Aug 2019 03:04:04.9594 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yozhao@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3948
X-Mailman-Approved-At: Fri, 02 Aug 2019 03:22:06 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4yIbA/zTqfdpYw68EiZFn5BgEC8/zG8WjgD19iwn+6I=;
 b=yO3YeKI2K6HoEgAgNkWGnGOINplgAtaO7GiOqwlgzSfpWkwrBBInNThBHIw8BLU9Q5sBYgmuA41VEKvTgBWGa5t8kuIaV8APXcdx2oMpj+QOOrMW570YTK1OlBoQdzOjDpd4uG73fN6IQyrih4dtcuQ7YKengYS4ckhBGz3FM3w=
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

VGhlIFZGIGRldmljZSBpbmZvIHNob3VsZCBiZSB0aGUgc2FtZSBhcyB0aGUgcmVndWxhciBvbmUu
CgpDaGFuZ2UtSWQ6IElhM2Y4ZTFkZWFjMTBhZjU3ZmVmNTllMzVlMzkzNTNlODA5ZjUyZDVkClNp
Z25lZC1vZmYtYnk6IFlvbmcgWmhhbyA8WW9uZy5aaGFvQGFtZC5jb20+Ci0tLQogZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRrZmQva2ZkX2RldmljZS5jIHwgNTggKystLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgNTUgZGVsZXRpb25zKC0pCgpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2RldmljZS5jIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2RldmljZS5jCmluZGV4IDNiOWZlNjI5YTEyNi4u
OWJjYmMwOGFiNmQyIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRf
ZGV2aWNlLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2RldmljZS5jCkBA
IC0xNDYsMjQgKzE0Niw2IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qga2ZkX2RldmljZV9pbmZvIGZp
amlfZGV2aWNlX2luZm8gPSB7CiAJLm51bV9zZG1hX3F1ZXVlc19wZXJfZW5naW5lID0gMiwKIH07
CiAKLXN0YXRpYyBjb25zdCBzdHJ1Y3Qga2ZkX2RldmljZV9pbmZvIGZpamlfdmZfZGV2aWNlX2lu
Zm8gPSB7Ci0JLmFzaWNfZmFtaWx5ID0gQ0hJUF9GSUpJLAotCS5tYXhfcGFzaWRfYml0cyA9IDE2
LAotCS5tYXhfbm9fb2ZfaHFkICA9IDI0LAotCS5kb29yYmVsbF9zaXplICA9IDQsCi0JLmloX3Jp
bmdfZW50cnlfc2l6ZSA9IDQgKiBzaXplb2YodWludDMyX3QpLAotCS5ldmVudF9pbnRlcnJ1cHRf
Y2xhc3MgPSAmZXZlbnRfaW50ZXJydXB0X2NsYXNzX2NpaywKLQkubnVtX29mX3dhdGNoX3BvaW50
cyA9IDQsCi0JLm1xZF9zaXplX2FsaWduZWQgPSBNUURfU0laRV9BTElHTkVELAotCS5zdXBwb3J0
c19jd3NyID0gdHJ1ZSwKLQkubmVlZHNfaW9tbXVfZGV2aWNlID0gZmFsc2UsCi0JLm5lZWRzX3Bj
aV9hdG9taWNzID0gZmFsc2UsCi0JLm51bV9zZG1hX2VuZ2luZXMgPSAyLAotCS5udW1feGdtaV9z
ZG1hX2VuZ2luZXMgPSAwLAotCS5udW1fc2RtYV9xdWV1ZXNfcGVyX2VuZ2luZSA9IDIsCi19Owot
Ci0KIHN0YXRpYyBjb25zdCBzdHJ1Y3Qga2ZkX2RldmljZV9pbmZvIHBvbGFyaXMxMF9kZXZpY2Vf
aW5mbyA9IHsKIAkuYXNpY19mYW1pbHkgPSBDSElQX1BPTEFSSVMxMCwKIAkubWF4X3Bhc2lkX2Jp
dHMgPSAxNiwKQEAgLTE4MSwyMyArMTYzLDYgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBrZmRfZGV2
aWNlX2luZm8gcG9sYXJpczEwX2RldmljZV9pbmZvID0gewogCS5udW1fc2RtYV9xdWV1ZXNfcGVy
X2VuZ2luZSA9IDIsCiB9OwogCi1zdGF0aWMgY29uc3Qgc3RydWN0IGtmZF9kZXZpY2VfaW5mbyBw
b2xhcmlzMTBfdmZfZGV2aWNlX2luZm8gPSB7Ci0JLmFzaWNfZmFtaWx5ID0gQ0hJUF9QT0xBUklT
MTAsCi0JLm1heF9wYXNpZF9iaXRzID0gMTYsCi0JLm1heF9ub19vZl9ocWQgID0gMjQsCi0JLmRv
b3JiZWxsX3NpemUgID0gNCwKLQkuaWhfcmluZ19lbnRyeV9zaXplID0gNCAqIHNpemVvZih1aW50
MzJfdCksCi0JLmV2ZW50X2ludGVycnVwdF9jbGFzcyA9ICZldmVudF9pbnRlcnJ1cHRfY2xhc3Nf
Y2lrLAotCS5udW1fb2Zfd2F0Y2hfcG9pbnRzID0gNCwKLQkubXFkX3NpemVfYWxpZ25lZCA9IE1R
RF9TSVpFX0FMSUdORUQsCi0JLnN1cHBvcnRzX2N3c3IgPSB0cnVlLAotCS5uZWVkc19pb21tdV9k
ZXZpY2UgPSBmYWxzZSwKLQkubmVlZHNfcGNpX2F0b21pY3MgPSBmYWxzZSwKLQkubnVtX3NkbWFf
ZW5naW5lcyA9IDIsCi0JLm51bV94Z21pX3NkbWFfZW5naW5lcyA9IDAsCi0JLm51bV9zZG1hX3F1
ZXVlc19wZXJfZW5naW5lID0gMiwKLX07Ci0KIHN0YXRpYyBjb25zdCBzdHJ1Y3Qga2ZkX2Rldmlj
ZV9pbmZvIHBvbGFyaXMxMV9kZXZpY2VfaW5mbyA9IHsKIAkuYXNpY19mYW1pbHkgPSBDSElQX1BP
TEFSSVMxMSwKIAkubWF4X3Bhc2lkX2JpdHMgPSAxNiwKQEAgLTI2NiwyMyArMjMxLDYgQEAgc3Rh
dGljIGNvbnN0IHN0cnVjdCBrZmRfZGV2aWNlX2luZm8gdmVnYTEwX2RldmljZV9pbmZvID0gewog
CS5udW1fc2RtYV9xdWV1ZXNfcGVyX2VuZ2luZSA9IDIsCiB9OwogCi1zdGF0aWMgY29uc3Qgc3Ry
dWN0IGtmZF9kZXZpY2VfaW5mbyB2ZWdhMTBfdmZfZGV2aWNlX2luZm8gPSB7Ci0JLmFzaWNfZmFt
aWx5ID0gQ0hJUF9WRUdBMTAsCi0JLm1heF9wYXNpZF9iaXRzID0gMTYsCi0JLm1heF9ub19vZl9o
cWQgID0gMjQsCi0JLmRvb3JiZWxsX3NpemUgID0gOCwKLQkuaWhfcmluZ19lbnRyeV9zaXplID0g
OCAqIHNpemVvZih1aW50MzJfdCksCi0JLmV2ZW50X2ludGVycnVwdF9jbGFzcyA9ICZldmVudF9p
bnRlcnJ1cHRfY2xhc3NfdjksCi0JLm51bV9vZl93YXRjaF9wb2ludHMgPSA0LAotCS5tcWRfc2l6
ZV9hbGlnbmVkID0gTVFEX1NJWkVfQUxJR05FRCwKLQkuc3VwcG9ydHNfY3dzciA9IHRydWUsCi0J
Lm5lZWRzX2lvbW11X2RldmljZSA9IGZhbHNlLAotCS5uZWVkc19wY2lfYXRvbWljcyA9IGZhbHNl
LAotCS5udW1fc2RtYV9lbmdpbmVzID0gMiwKLQkubnVtX3hnbWlfc2RtYV9lbmdpbmVzID0gMCwK
LQkubnVtX3NkbWFfcXVldWVzX3Blcl9lbmdpbmUgPSAyLAotfTsKLQogc3RhdGljIGNvbnN0IHN0
cnVjdCBrZmRfZGV2aWNlX2luZm8gdmVnYTEyX2RldmljZV9pbmZvID0gewogCS5hc2ljX2ZhbWls
eSA9IENISVBfVkVHQTEyLAogCS5tYXhfcGFzaWRfYml0cyA9IDE2LApAQCAtNDA4LDcgKzM1Niw3
IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qga2ZkX2RldmljZWlkIHN1cHBvcnRlZF9kZXZpY2VzW10g
PSB7CiAJeyAweDY5MzgsICZ0b25nYV9kZXZpY2VfaW5mbyB9LAkJLyogVG9uZ2EgKi8KIAl7IDB4
NjkzOSwgJnRvbmdhX2RldmljZV9pbmZvIH0sCQkvKiBUb25nYSAqLwogCXsgMHg3MzAwLCAmZmlq
aV9kZXZpY2VfaW5mbyB9LAkJLyogRmlqaSAqLwotCXsgMHg3MzBGLCAmZmlqaV92Zl9kZXZpY2Vf
aW5mbyB9LAkvKiBGaWppIHZmKi8KKwl7IDB4NzMwRiwgJmZpamlfZGV2aWNlX2luZm8gfSwJCS8q
IEZpamkgdmYqLwogCXsgMHg2N0MwLCAmcG9sYXJpczEwX2RldmljZV9pbmZvIH0sCS8qIFBvbGFy
aXMxMCAqLwogCXsgMHg2N0MxLCAmcG9sYXJpczEwX2RldmljZV9pbmZvIH0sCS8qIFBvbGFyaXMx
MCAqLwogCXsgMHg2N0MyLCAmcG9sYXJpczEwX2RldmljZV9pbmZvIH0sCS8qIFBvbGFyaXMxMCAq
LwpAQCAtNDE5LDcgKzM2Nyw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qga2ZkX2RldmljZWlkIHN1
cHBvcnRlZF9kZXZpY2VzW10gPSB7CiAJeyAweDY3Q0EsICZwb2xhcmlzMTBfZGV2aWNlX2luZm8g
fSwJLyogUG9sYXJpczEwICovCiAJeyAweDY3Q0MsICZwb2xhcmlzMTBfZGV2aWNlX2luZm8gfSwJ
LyogUG9sYXJpczEwICovCiAJeyAweDY3Q0YsICZwb2xhcmlzMTBfZGV2aWNlX2luZm8gfSwJLyog
UG9sYXJpczEwICovCi0JeyAweDY3RDAsICZwb2xhcmlzMTBfdmZfZGV2aWNlX2luZm8gfSwJLyog
UG9sYXJpczEwIHZmKi8KKwl7IDB4NjdEMCwgJnBvbGFyaXMxMF9kZXZpY2VfaW5mbyB9LAkvKiBQ
b2xhcmlzMTAgdmYqLwogCXsgMHg2N0RGLCAmcG9sYXJpczEwX2RldmljZV9pbmZvIH0sCS8qIFBv
bGFyaXMxMCAqLwogCXsgMHg2RkRGLCAmcG9sYXJpczEwX2RldmljZV9pbmZvIH0sCS8qIFBvbGFy
aXMxMCAqLwogCXsgMHg2N0UwLCAmcG9sYXJpczExX2RldmljZV9pbmZvIH0sCS8qIFBvbGFyaXMx
MSAqLwpAQCAtNDUyLDcgKzQwMCw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qga2ZkX2RldmljZWlk
IHN1cHBvcnRlZF9kZXZpY2VzW10gPSB7CiAJeyAweDY4NjksICZ2ZWdhMTBfZGV2aWNlX2luZm8g
fSwJLyogVmVnYTEwICovCiAJeyAweDY4NkEsICZ2ZWdhMTBfZGV2aWNlX2luZm8gfSwJLyogVmVn
YTEwICovCiAJeyAweDY4NkIsICZ2ZWdhMTBfZGV2aWNlX2luZm8gfSwJLyogVmVnYTEwICovCi0J
eyAweDY4NkMsICZ2ZWdhMTBfdmZfZGV2aWNlX2luZm8gfSwJLyogVmVnYTEwICB2ZiovCisJeyAw
eDY4NkMsICZ2ZWdhMTBfZGV2aWNlX2luZm8gfSwJLyogVmVnYTEwICB2ZiovCiAJeyAweDY4NkQs
ICZ2ZWdhMTBfZGV2aWNlX2luZm8gfSwJLyogVmVnYTEwICovCiAJeyAweDY4NkUsICZ2ZWdhMTBf
ZGV2aWNlX2luZm8gfSwJLyogVmVnYTEwICovCiAJeyAweDY4NkYsICZ2ZWdhMTBfZGV2aWNlX2lu
Zm8gfSwJLyogVmVnYTEwICovCi0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vYW1kLWdmeA==
