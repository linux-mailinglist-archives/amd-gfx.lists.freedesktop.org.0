Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C19CCFC3D2
	for <lists+amd-gfx@lfdr.de>; Thu, 14 Nov 2019 11:17:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 275546E52F;
	Thu, 14 Nov 2019 10:17:34 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820053.outbound.protection.outlook.com [40.107.82.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 731D46E52F
 for <amd-gfx@lists.freedesktop.org>; Thu, 14 Nov 2019 10:17:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SWHLKb1C3913rrjJWpDBirDtINBrPHdHgigxA0L0LZ//gKFeXigzwmE2AjIkrT8leNTWA9brGw+7ZRPj2KKxddDBoihWnDdgj3K3xF3TSLfrm5k0Vmi9TAQqhSWuq4fwcJvx4rDQ+OK/ElTaC589PIGG/R0k+/OF6UwWSBh5v+i+dpE4MeBjQWUGsytwTNTWV7Wss+Q2Q7FXIHSSX5UylklkQl7SQyPrQIBpPpgj0jhtGguO9y9HiyP+pB8dohWGYjcjrp/fvrpH2+vmssZLHt+2iucR7MDH0bu5qrcPhWJ23K4/Wk7z4akeyP0ljAfXR9yoNp/p4RFz77L7NlsOTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z46IDklOqFOmEitaq+4uxb3DTB5Bh01rg6mEbIni3tE=;
 b=KtGTcc9Jp3P1kUjsUXbMHUek01vR4gewfpAcO1i4NNrxViNNmFZUP4TfH4DzPIO40SmVIYZ+R3RX9T8Mio6TxeR4ql1AwdOGUUtWKyKBejs3hylNonq+tAZ37jWe6RJoLmGsmEtfjlivPiCdfhOQQuim64GW5Vu6fmh18ColzUzSEAWKT/AWUX3lP53IoUb2VFXOmI+ylqfeoXFC5PlMWrn9JQqgyf5Uo2gsYHbumCVHeDOqcZCMmN+vL6QzJkLywFx4sJ4zo4CeEVc+me8RSPNjyxNUyocMe9uwCtHPc0FB8xxpKNz0Slt20+PgmgOtmTs6WcTeYRfvvA6D7Jj3OA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB2896.namprd12.prod.outlook.com (20.179.80.214) by
 MN2PR12MB3246.namprd12.prod.outlook.com (20.179.81.213) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2430.24; Thu, 14 Nov 2019 10:17:30 +0000
Received: from MN2PR12MB2896.namprd12.prod.outlook.com
 ([fe80::9821:4373:684f:f580]) by MN2PR12MB2896.namprd12.prod.outlook.com
 ([fe80::9821:4373:684f:f580%6]) with mapi id 15.20.2451.023; Thu, 14 Nov 2019
 10:17:29 +0000
From: "Changfeng.Zhu" <changfeng.zhu@amd.com>
To: amd-gfx@lists.freedesktop.org, Christian.Koenig@amd.com, Ray.Huang@amd.com,
 Jack.Xiao@amd.com, Tao.Zhou1@amd.com, Xinmei.Huang@amd.com
Subject: [PATCH 2/2] drm/amdgpu: invalidate semphore mmhub workaround for
 gfx9/gfx10
Date: Thu, 14 Nov 2019 18:17:05 +0800
Message-Id: <20191114101705.6865-1-changfeng.zhu@amd.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: HK0P153CA0044.APCP153.PROD.OUTLOOK.COM
 (2603:1096:203:17::32) To MN2PR12MB2896.namprd12.prod.outlook.com
 (2603:10b6:208:ab::22)
MIME-Version: 1.0
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [180.167.199.189]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: c0c05ae3-2bc8-4043-a9a8-08d768ebdacb
X-MS-TrafficTypeDiagnostic: MN2PR12MB3246:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB32469253984A3D666038C29BFD710@MN2PR12MB3246.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-Forefront-PRVS: 02213C82F8
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(39860400002)(366004)(396003)(376002)(346002)(189003)(199004)(478600001)(1076003)(6486002)(386003)(476003)(2616005)(30864003)(66556008)(6506007)(66476007)(50466002)(6512007)(186003)(47776003)(66066001)(52116002)(48376002)(66946007)(5660300002)(51416003)(50226002)(316002)(6436002)(25786009)(6116002)(3846002)(99286004)(14444005)(86362001)(6636002)(26005)(36756003)(14454004)(2906002)(7736002)(8676002)(16586007)(4326008)(305945005)(6666004)(8936002)(486006)(81156014)(81166006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3246;
 H:MN2PR12MB2896.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0VBOryQd3zFzu5r5i809X9kQx+v9iHfSpFh7v38s1HX3a6lebk4ujaHqG7LpSxC+Pw0qbzZDVIn9VyzfEvS5Lgi8cvPYPfzYEW/VZ+Suvy1ecLvpRWBVhfplRbMZDPRvabQVMUtcoseo69tQoW7RxSBk40EwoPjK2KprxK73mFa2GtuGkcGzwAfmlBSb+QafX9uR1af6/2bJuXGimr0AAg9J+jjlSHv4/89oCg8J0XQEFW1BFssovCUAu0/8veFdO4khaMuXks/kA5bUqCuNs7heCzLZ9PzZ8TVRzCpiDNcMClljO9fiqPkpvE/VWtLjKGpOuyjSKveiWrSZBmak/dEWUp6xF6vy5zHMvUvtXBfmhq0uaYc6Tm45ICwtgKN+YOi+HQ/ZTgbPg11aygIY16XBwkiMhswx93U11LJjxrQE6AWDxssepXBiqxnU7+2U
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0c05ae3-2bc8-4043-a9a8-08d768ebdacb
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2019 10:17:29.7465 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y1mLtHJxvJgvHUgBKf+sEiq+q8spmeINRFQ0QkSEBv6e1ow5aAmO+OVlRwxx/QEPSVPFOYY5qmlX5tVeRytZjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3246
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z46IDklOqFOmEitaq+4uxb3DTB5Bh01rg6mEbIni3tE=;
 b=G4Y42AP6oKa/y4mI4vnxk4n9hstcZ42K59V40cJLL4HfRXB2PGhLyKwYVbfAJwzdniD2eMUJ5SFFrd0DAejvi8G/RTIFGz5DxLsKvlVwN7E8c/FzbyZOA+wgTV8wcLwI4T7ztDW4jyAIkN7Ey9Y8s8HVF4NrgzV+nst0JT5m34g=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Changfeng.Zhu@amd.com; 
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
Cc: changzhu <Changfeng.Zhu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogY2hhbmd6aHUgPENoYW5nZmVuZy5aaHVAYW1kLmNvbT4KCk1NSFVCIG1heSBsb3NlIEdQ
VVZNIGludmFsaWRhdGUgYWNrbm93bGVkZ2Ugc3RhdGUgYWNyb3NzIHBvd2VyLWdhdGluZyBvZmYK
Y3ljbGUgd2hlbiBpdCBkb2VzIGludmFsaWRhdGlvbiByZXEvYWNrIHdvcmsuCgpTbyB3ZSBtdXN0
IGFjcXVpcmUvcmVsZWFzZSBvbmUgb2YgdGhlIHZtX2ludmFsaWRhdGVfZW5nKl9zZW0gYXJvdW5k
IHRoZQppbnZhbGlkYXRpb24gcmVxL2Fjay4KCkJlc2lkZXMsIHZtX2ludmFsaWRhdGVfZW5nKl9z
ZW0gd2lsbCBiZSByZWFkLW9ubHkgYWZ0ZXIgYWNxdWlyZSBpdC4gU28KaXQgbWF5IGNhdXNlIGRl
YWQgbG9jayB3aGVuIG9uZSBwcm9jZXNzIGFjcXVpcmVzIHZtX2ludmFsaWRhdGVfZW5nKl9zZW0K
YW5kIGFub3RoZXIgcHJvY2VzcyBhY3F1aXJlcyB0aGUgc2FtZSB2bV9pbnZhbGlkYXRlX2VuZypf
c2VtCmltbWVkaWF0ZWx5LgoKSW4gY2FzZSBvZiBkZWFkIGxvY2ssIGl0IG5lZWRzIHRvIGFkZCBz
cGlubG9jayB3aGVuIGRvaW5nIGludmFsaWRhdGlvbgpyZXEvYWNrLgoKQ2hhbmdlLUlkOiBJY2E2
MzU5M2UxZGMyNjQ0NGFjOWMwNWNjZWQwOTg4NTE1MDgyZGVmMwpTaWduZWQtb2ZmLWJ5OiBjaGFu
Z3podSA8Q2hhbmdmZW5nLlpodUBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2dtY192MTBfMC5jIHwgNjAgKysrKysrKysrKysrKysrKy0KIGRyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2dtY192OV8wLmMgIHwgOTAgKysrKysrKysrKysrKysrKysrKysrKysrKy0KIGRy
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NkbWFfdjRfMC5jIHwgIDggKystCiBkcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS91dmRfdjdfMC5jICB8ICA4ICsrLQogZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvdmNlX3Y0XzAuYyAgfCAgNCArLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
dmNuX3YxXzAuYyAgfCAxMiArKystCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS92Y25fdjJf
MC5jICB8IDEyICsrKy0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3Zjbl92Ml81LmMgIHwg
MTIgKysrLQogOCBmaWxlcyBjaGFuZ2VkLCAxOTAgaW5zZXJ0aW9ucygrKSwgMTYgZGVsZXRpb25z
KC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3YxMF8wLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjEwXzAuYwppbmRleCBhZjI2MTViYTUy
YWEuLmI3OTQ4YzYzYWQwZCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
Z21jX3YxMF8wLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3YxMF8wLmMK
QEAgLTI5LDYgKzI5LDcgQEAKICNpbmNsdWRlICJoZHAvaGRwXzVfMF8wX3NoX21hc2suaCIKICNp
bmNsdWRlICJnYy9nY18xMF8xXzBfc2hfbWFzay5oIgogI2luY2x1ZGUgIm1taHViL21taHViXzJf
MF8wX3NoX21hc2suaCIKKyNpbmNsdWRlICJtbWh1Yi9tbWh1Yl8yXzBfMF9vZmZzZXQuaCIKICNp
bmNsdWRlICJkY24vZGNuXzJfMF8wX29mZnNldC5oIgogI2luY2x1ZGUgImRjbi9kY25fMl8wXzBf
c2hfbWFzay5oIgogI2luY2x1ZGUgIm9zcy9vc3NzeXNfNV8wXzBfb2Zmc2V0LmgiCkBAIC0yMzIs
NyArMjMzLDMwIEBAIHN0YXRpYyB2b2lkIGdtY192MTBfMF9mbHVzaF92bV9odWIoc3RydWN0IGFt
ZGdwdV9kZXZpY2UgKmFkZXYsIHVpbnQzMl90IHZtaWQsCiAJdTMyIHRtcCA9IGdtY192MTBfMF9n
ZXRfaW52YWxpZGF0ZV9yZXEodm1pZCwgZmx1c2hfdHlwZSk7CiAJLyogVXNlIHJlZ2lzdGVyIDE3
IGZvciBHQVJUICovCiAJY29uc3QgdW5zaWduZWQgZW5nID0gMTc7Ci0JdW5zaWduZWQgaW50IGk7
CisJdW5zaWduZWQgaW50IGksIGo7CisJdWludDMyX3Qgdm1faW52X2VuZzBfc2VtID0gU09DMTVf
UkVHX09GRlNFVChNTUhVQiwgMCwKKwkJCQkJCSAgICBtbU1NVk1fSU5WQUxJREFURV9FTkcwX1NF
TSk7CisKKwlzcGluX2xvY2soJmFkZXYtPmdtYy5pbnZhbGlkYXRlX2xvY2spOworCisJLyoKKwkg
KiBtbWh1YiBsb3NlcyBncHV2bSBpbnZhbGlkYXRlIGFja25vd2xkZWdlIHN0YXRlIGFjcm9zcyBw
b3dlci1nYXRpbmcKKwkgKiBvZmYgY3ljbGUsIGFkZCBzZW1hcGhvcmUgYWNxdWlyZSBiZWZvcmUg
aW52YWxpZGF0aW9uIGFuZCBzZW1hcGhvcmUKKwkgKiByZWxlYXNlIGFmdGVyIGludmFsaWRhdGlv
biB0byBhdm9pZCBtbWh1YiBlbnRlcmluZyBwb3dlciBnYXRlZAorCSAqIHN0YXRlIHRvIFdBIHRo
ZSBJc3N1ZQorCSAqLworCWlmICh2bWh1YiA9PSBBTURHUFVfTU1IVUJfMCB8fCB2bWh1YiA9PSBB
TURHUFVfTU1IVUJfMSkgeworCQlmb3IgKGogPSAwOyBqIDwgYWRldi0+dXNlY190aW1lb3V0OyBq
KyspIHsKKwkJCS8qIGEgcmVhZCByZXR1cm4gdmFsdWUgb2YgMSBtZWFucyBzZW1hcGhvcmUgYWN1
cWlyZSAqLworCQkJdG1wID0gUlJFRzMyX05PX0tJUSh2bV9pbnZfZW5nMF9zZW0gKyBlbmcpOwor
CQkJaWYgKHRtcCAmIDB4MSkKKwkJCQlicmVhazsKKwkJCXVkZWxheSgxKTsKKwkJfQorCisJaWYg
KGogPj0gYWRldi0+dXNlY190aW1lb3V0KQorCQlEUk1fRVJST1IoIlRpbWVvdXQgd2FpdGluZyBm
b3Igc2VtIGFjcXVpcmUgaW4gVk0gZmx1c2ghXG4iKTsKKwl9CiAKIAlXUkVHMzJfTk9fS0lRKGh1
Yi0+dm1faW52X2VuZzBfcmVxICsgZW5nLCB0bXApOwogCkBAIC0yNTMsNiArMjc3LDE1IEBAIHN0
YXRpYyB2b2lkIGdtY192MTBfMF9mbHVzaF92bV9odWIoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFk
ZXYsIHVpbnQzMl90IHZtaWQsCiAJCXVkZWxheSgxKTsKIAl9CiAKKwkvKgorCSAqIGFkZCBzZW1h
cGhvcmUgcmVsZWFzZSBhZnRlciBpbnZhbGlkYXRpb24sCisJICogd3JpdGUgd2l0aCAwIG1lYW5z
IHNlbWFwaG9yZSByZWxlYXNlCisJICovCisJaWYgKHZtaHViID09IEFNREdQVV9NTUhVQl8wIHx8
IHZtaHViID09IEFNREdQVV9NTUhVQl8xKQorCQlXUkVHMzJfTk9fS0lRKHZtX2ludl9lbmcwX3Nl
bSArIGVuZywgMCk7CisKKwlzcGluX3VubG9jaygmYWRldi0+Z21jLmludmFsaWRhdGVfbG9jayk7
CisKIAlpZiAoaSA8IGFkZXYtPnVzZWNfdGltZW91dCkKIAkJcmV0dXJuOwogCkBAIC0zMzQsOSAr
MzY3LDI2IEBAIHN0YXRpYyB2b2lkIGdtY192MTBfMF9mbHVzaF9ncHVfdGxiKHN0cnVjdCBhbWRn
cHVfZGV2aWNlICphZGV2LCB1aW50MzJfdCB2bWlkLAogc3RhdGljIHVpbnQ2NF90IGdtY192MTBf
MF9lbWl0X2ZsdXNoX2dwdV90bGIoc3RydWN0IGFtZGdwdV9yaW5nICpyaW5nLAogCQkJCQkgICAg
IHVuc2lnbmVkIHZtaWQsIHVpbnQ2NF90IHBkX2FkZHIpCiB7CisJc3RydWN0IGFtZGdwdV9kZXZp
Y2UgKmFkZXYgPSByaW5nLT5hZGV2OwogCXN0cnVjdCBhbWRncHVfdm1odWIgKmh1YiA9ICZyaW5n
LT5hZGV2LT52bWh1YltyaW5nLT5mdW5jcy0+dm1odWJdOwogCXVpbnQzMl90IHJlcSA9IGdtY192
MTBfMF9nZXRfaW52YWxpZGF0ZV9yZXEodm1pZCwgMCk7CiAJdW5zaWduZWQgZW5nID0gcmluZy0+
dm1faW52X2VuZzsKKwl1aW50MzJfdCB2bV9pbnZfZW5nMF9zZW0gPSBTT0MxNV9SRUdfT0ZGU0VU
KE1NSFVCLCAwLAorCQkJCQkJICAgIG1tTU1WTV9JTlZBTElEQVRFX0VORzBfU0VNKTsKKworCXNw
aW5fbG9jaygmYWRldi0+Z21jLmludmFsaWRhdGVfbG9jayk7CisKKwkvKgorCSAqIG1taHViIGxv
c2VzIGdwdXZtIGludmFsaWRhdGUgYWNrbm93bGRlZ2Ugc3RhdGUgYWNyb3NzIHBvd2VyLWdhdGlu
ZworCSAqIG9mZiBjeWNsZSwgYWRkIHNlbWFwaG9yZSBhY3F1aXJlIGJlZm9yZSBpbnZhbGlkYXRp
b24gYW5kIHNlbWFwaG9yZQorCSAqIHJlbGVhc2UgYWZ0ZXIgaW52YWxpZGF0aW9uIHRvIGF2b2lk
IG1taHViIGVudGVyaW5nIHBvd2VyIGdhdGVkCisJICogc3RhdGUgdG8gV0EgdGhlIElzc3VlCisJ
ICovCisKKwlpZiAocmluZy0+ZnVuY3MtPnZtaHViID09IEFNREdQVV9NTUhVQl8wIHx8IHJpbmct
PmZ1bmNzLT52bWh1YiA9PSBBTURHUFVfTU1IVUJfMSkKKwkJLyogYSByZWFkIHJldHVybiB2YWx1
ZSBvZiAxIG1lYW5zIHNlbWFwaG9yZSBhY3VxaXJlICovCisJCWFtZGdwdV9yaW5nX2VtaXRfcmVn
X3dhaXQocmluZywKKwkJCQkJICB2bV9pbnZfZW5nMF9zZW0gKyBlbmcsIDB4MSwgMHgxKTsKIAog
CWFtZGdwdV9yaW5nX2VtaXRfd3JlZyhyaW5nLCBodWItPmN0eDBfcHRiX2FkZHJfbG8zMiArICgy
ICogdm1pZCksCiAJCQkgICAgICBsb3dlcl8zMl9iaXRzKHBkX2FkZHIpKTsKQEAgLTM0Nyw2ICsz
OTcsMTQgQEAgc3RhdGljIHVpbnQ2NF90IGdtY192MTBfMF9lbWl0X2ZsdXNoX2dwdV90bGIoc3Ry
dWN0IGFtZGdwdV9yaW5nICpyaW5nLAogCWFtZGdwdV9yaW5nX2VtaXRfcmVnX3dyaXRlX3JlZ193
YWl0KHJpbmcsIGh1Yi0+dm1faW52X2VuZzBfcmVxICsgZW5nLAogCQkJCQkgICAgaHViLT52bV9p
bnZfZW5nMF9hY2sgKyBlbmcsCiAJCQkJCSAgICByZXEsIDEgPDwgdm1pZCk7CisJLyoKKwkgKiBh
ZGQgc2VtYXBob3JlIHJlbGVhc2UgYWZ0ZXIgaW52YWxpZGF0aW9uLAorCSAqIHdyaXRlIHdpdGgg
MCBtZWFucyBzZW1hcGhvcmUgcmVsZWFzZQorCSAqLworCWlmIChyaW5nLT5mdW5jcy0+dm1odWIg
PT0gQU1ER1BVX01NSFVCXzAgfHwgcmluZy0+ZnVuY3MtPnZtaHViID09IEFNREdQVV9NTUhVQl8x
KQorCQlhbWRncHVfcmluZ19lbWl0X3dyZWcocmluZywgdm1faW52X2VuZzBfc2VtICsgZW5nLCAw
KTsKKworCXNwaW5fdW5sb2NrKCZhZGV2LT5nbWMuaW52YWxpZGF0ZV9sb2NrKTsKIAogCXJldHVy
biBwZF9hZGRyOwogfQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21j
X3Y5XzAuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OV8wLmMKaW5kZXggZThl
MWU2ZTg2ZTc3Li45MjkxZDFhZjc0M2UgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2dtY192OV8wLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y5
XzAuYwpAQCAtMzQsNiArMzQsNyBAQAogI2luY2x1ZGUgImRjZS9kY2VfMTJfMF9zaF9tYXNrLmgi
CiAjaW5jbHVkZSAidmVnYTEwX2VudW0uaCIKICNpbmNsdWRlICJtbWh1Yi9tbWh1Yl8xXzBfb2Zm
c2V0LmgiCisjaW5jbHVkZSAibW1odWIvbW1odWJfMl8wXzBfb2Zmc2V0LmgiCiAjaW5jbHVkZSAi
YXRodWIvYXRodWJfMV8wX29mZnNldC5oIgogI2luY2x1ZGUgIm9zcy9vc3NzeXNfNF8wX29mZnNl
dC5oIgogCkBAIC00MzIsOCArNDMzLDEwIEBAIHN0YXRpYyB2b2lkIGdtY192OV8wX2ZsdXNoX2dw
dV90bGIoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsIHVpbnQzMl90IHZtaWQsCiAJCQkJCXVp
bnQzMl90IHZtaHViLCB1aW50MzJfdCBmbHVzaF90eXBlKQogewogCWNvbnN0IHVuc2lnbmVkIGVu
ZyA9IDE3OwotCXUzMiBqLCB0bXA7CisJdTMyIGksIGosIHRtcDsKIAlzdHJ1Y3QgYW1kZ3B1X3Zt
aHViICpodWI7CisJaW50MzJfdCB2bV9pbnZfZW5nMF9zZW0gPSBTT0MxNV9SRUdfT0ZGU0VUKE1N
SFVCLCAwLAorCQkJCQkJICAgbW1NTVZNX0lOVkFMSURBVEVfRU5HMF9TRU0pOwogCiAJQlVHX09O
KHZtaHViID49IGFkZXYtPm51bV92bWh1YnMpOwogCkBAIC00NDksMTIgKzQ1Miw2MyBAQCBzdGF0
aWMgdm9pZCBnbWNfdjlfMF9mbHVzaF9ncHVfdGxiKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2
LCB1aW50MzJfdCB2bWlkLAogCQl1aW50MzJfdCByZXEgPSBodWItPnZtX2ludl9lbmcwX3JlcSAr
IGVuZzsKIAkJdWludDMyX3QgYWNrID0gaHViLT52bV9pbnZfZW5nMF9hY2sgKyBlbmc7CiAKKwlz
cGluX2xvY2soJmFkZXYtPmdtYy5pbnZhbGlkYXRlX2xvY2spOworCisJLyoKKwkgKiBtbWh1YiBs
b3NlcyBncHV2bSBpbnZhbGlkYXRlIGFja25vd2xkZWdlIHN0YXRlIGFjcm9zcyBwb3dlci1nYXRp
bmcKKwkgKiBvZmYgY3ljbGUsIGFkZCBzZW1hcGhvcmUgYWNxdWlyZSBiZWZvcmUgaW52YWxpZGF0
aW9uIGFuZCBzZW1hcGhvcmUKKwkgKiByZWxlYXNlIGFmdGVyIGludmFsaWRhdGlvbiB0byBhdm9p
ZCBtbWh1YiBlbnRlcmluZyBwb3dlciBnYXRlZAorCSAqIHN0YXRlIHRvIFdBIHRoZSBJc3N1ZQor
CSAqLworCWlmICh2bWh1YiA9PSBBTURHUFVfTU1IVUJfMCB8fCB2bWh1YiA9PSBBTURHUFVfTU1I
VUJfMSkgeworCQlmb3IgKGkgPSAwOyBpIDwgYWRldi0+dXNlY190aW1lb3V0OyBpKyspIHsKKwkJ
CS8qIGEgcmVhZCByZXR1cm4gdmFsdWUgb2YgMSBtZWFucyBzZW1hcGhvcmUgYWN1cWlyZSAqLwor
CQkJdG1wID0gUlJFRzMyX05PX0tJUSh2bV9pbnZfZW5nMF9zZW0gKyBlbmcpOworCQkJaWYgKHRt
cCAmIDB4MSkKKwkJCQlicmVhazsKKwkJCXVkZWxheSgxKTsKKwkJfQorCisJaWYgKGkgPj0gYWRl
di0+dXNlY190aW1lb3V0KQorCQlEUk1fRVJST1IoIlRpbWVvdXQgd2FpdGluZyBmb3Igc2VtIGFj
cXVpcmUgaW4gVk0gZmx1c2ghXG4iKTsKKwl9CisKIAkJYW1kZ3B1X3ZpcnRfa2lxX3JlZ193cml0
ZV9yZWdfd2FpdChhZGV2LCByZXEsIGFjaywgdG1wLAogCQkJCTEgPDwgdm1pZCk7CisKKwkvKgor
CSAqIGFkZCBzZW1hcGhvcmUgcmVsZWFzZSBhZnRlciBpbnZhbGlkYXRpb24sCisJICogd3JpdGUg
d2l0aCAwIG1lYW5zIHNlbWFwaG9yZSByZWxlYXNlCisJICovCisJaWYgKHZtaHViID09IEFNREdQ
VV9NTUhVQl8wIHx8IHZtaHViID09IEFNREdQVV9NTUhVQl8xKQorCQlXUkVHMzJfTk9fS0lRKHZt
X2ludl9lbmcwX3NlbSArIGVuZywgMCk7CisKKwlzcGluX3VubG9jaygmYWRldi0+Z21jLmludmFs
aWRhdGVfbG9jayk7CisKIAkJcmV0dXJuOwogCX0KIAogCXNwaW5fbG9jaygmYWRldi0+Z21jLmlu
dmFsaWRhdGVfbG9jayk7CisKKwkvKgorCSAqIG1taHViIGxvc2VzIGdwdXZtIGludmFsaWRhdGUg
YWNrbm93bGRlZ2Ugc3RhdGUgYWNyb3NzIHBvd2VyLWdhdGluZworCSAqIG9mZiBjeWNsZSwgYWRk
IHNlbWFwaG9yZSBhY3F1aXJlIGJlZm9yZSBpbnZhbGlkYXRpb24gYW5kIHNlbWFwaG9yZQorCSAq
IHJlbGVhc2UgYWZ0ZXIgaW52YWxpZGF0aW9uIHRvIGF2b2lkIG1taHViIGVudGVyaW5nIHBvd2Vy
IGdhdGVkCisJICogc3RhdGUgdG8gV0EgdGhlIElzc3VlCisJICovCisJaWYgKHZtaHViID09IEFN
REdQVV9NTUhVQl8wIHx8IHZtaHViID09IEFNREdQVV9NTUhVQl8xKSB7CisJCWZvciAoaSA9IDA7
IGkgPCBhZGV2LT51c2VjX3RpbWVvdXQ7IGkrKykgeworCQkJLyogYSByZWFkIHJldHVybiB2YWx1
ZSBvZiAxIG1lYW5zIHNlbWFwaG9yZSBhY3VxaXJlICovCisJCQl0bXAgPSBSUkVHMzJfTk9fS0lR
KHZtX2ludl9lbmcwX3NlbSArIGVuZyk7CisJCQlpZiAodG1wICYgMHgxKQorCQkJCWJyZWFrOwor
CQkJdWRlbGF5KDEpOworCQl9CisKKwlpZiAoaSA+PSBhZGV2LT51c2VjX3RpbWVvdXQpCisJCURS
TV9FUlJPUigiVGltZW91dCB3YWl0aW5nIGZvciBzZW0gYWNxdWlyZSBpbiBWTSBmbHVzaCFcbiIp
OworCX0KKwogCVdSRUczMl9OT19LSVEoaHViLT52bV9pbnZfZW5nMF9yZXEgKyBlbmcsIHRtcCk7
CiAKIAkvKgpAQCAtNDcwLDcgKzUyNCwxNiBAQCBzdGF0aWMgdm9pZCBnbWNfdjlfMF9mbHVzaF9n
cHVfdGxiKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LCB1aW50MzJfdCB2bWlkLAogCQkJYnJl
YWs7CiAJCXVkZWxheSgxKTsKIAl9CisKKwkvKgorCSAqIGFkZCBzZW1hcGhvcmUgcmVsZWFzZSBh
ZnRlciBpbnZhbGlkYXRpb24sCisJICogd3JpdGUgd2l0aCAwIG1lYW5zIHNlbWFwaG9yZSByZWxl
YXNlCisJICovCisJaWYgKHZtaHViID09IEFNREdQVV9NTUhVQl8wIHx8IHZtaHViID09IEFNREdQ
VV9NTUhVQl8xKQorCQlXUkVHMzJfTk9fS0lRKHZtX2ludl9lbmcwX3NlbSArIGVuZywgMCk7CisK
IAlzcGluX3VubG9jaygmYWRldi0+Z21jLmludmFsaWRhdGVfbG9jayk7CisKIAlpZiAoaiA8IGFk
ZXYtPnVzZWNfdGltZW91dCkKIAkJcmV0dXJuOwogCkBAIC00ODQsNiArNTQ3LDIyIEBAIHN0YXRp
YyB1aW50NjRfdCBnbWNfdjlfMF9lbWl0X2ZsdXNoX2dwdV90bGIoc3RydWN0IGFtZGdwdV9yaW5n
ICpyaW5nLAogCXN0cnVjdCBhbWRncHVfdm1odWIgKmh1YiA9ICZhZGV2LT52bWh1YltyaW5nLT5m
dW5jcy0+dm1odWJdOwogCXVpbnQzMl90IHJlcSA9IGdtY192OV8wX2dldF9pbnZhbGlkYXRlX3Jl
cSh2bWlkLCAwKTsKIAl1bnNpZ25lZCBlbmcgPSByaW5nLT52bV9pbnZfZW5nOworCXVpbnQzMl90
IHZtX2ludl9lbmcwX3NlbSA9IFNPQzE1X1JFR19PRkZTRVQoTU1IVUIsIDAsCisJCQkJCQkgICAg
bW1NTVZNX0lOVkFMSURBVEVfRU5HMF9TRU0pOworCisJc3Bpbl9sb2NrKCZhZGV2LT5nbWMuaW52
YWxpZGF0ZV9sb2NrKTsKKworCS8qCisJICogbW1odWIgbG9zZXMgZ3B1dm0gaW52YWxpZGF0ZSBh
Y2tub3dsZGVnZSBzdGF0ZSBhY3Jvc3MgcG93ZXItZ2F0aW5nCisJICogb2ZmIGN5Y2xlLCBhZGQg
c2VtYXBob3JlIGFjcXVpcmUgYmVmb3JlIGludmFsaWRhdGlvbiBhbmQgc2VtYXBob3JlCisJICog
cmVsZWFzZSBhZnRlciBpbnZhbGlkYXRpb24gdG8gYXZvaWQgbW1odWIgZW50ZXJpbmcgcG93ZXIg
Z2F0ZWQKKwkgKiBzdGF0ZSB0byBXQSB0aGUgSXNzdWUKKwkgKi8KKworCWlmIChyaW5nLT5mdW5j
cy0+dm1odWIgPT0gQU1ER1BVX01NSFVCXzAgfHwgcmluZy0+ZnVuY3MtPnZtaHViID09IEFNREdQ
VV9NTUhVQl8xKQorCQkvKiBhIHJlYWQgcmV0dXJuIHZhbHVlIG9mIDEgbWVhbnMgc2VtYXBob3Jl
IGFjdXFpcmUgKi8KKwkJYW1kZ3B1X3JpbmdfZW1pdF9yZWdfd2FpdChyaW5nLAorCQkJCQkgIHZt
X2ludl9lbmcwX3NlbSArIGVuZywgMHgxLCAweDEpOwogCiAJYW1kZ3B1X3JpbmdfZW1pdF93cmVn
KHJpbmcsIGh1Yi0+Y3R4MF9wdGJfYWRkcl9sbzMyICsgKDIgKiB2bWlkKSwKIAkJCSAgICAgIGxv
d2VyXzMyX2JpdHMocGRfYWRkcikpOwpAQCAtNDk1LDYgKzU3NCwxNSBAQCBzdGF0aWMgdWludDY0
X3QgZ21jX3Y5XzBfZW1pdF9mbHVzaF9ncHVfdGxiKHN0cnVjdCBhbWRncHVfcmluZyAqcmluZywK
IAkJCQkJICAgIGh1Yi0+dm1faW52X2VuZzBfYWNrICsgZW5nLAogCQkJCQkgICAgcmVxLCAxIDw8
IHZtaWQpOwogCisJLyoKKwkgKiBhZGQgc2VtYXBob3JlIHJlbGVhc2UgYWZ0ZXIgaW52YWxpZGF0
aW9uLAorCSAqIHdyaXRlIHdpdGggMCBtZWFucyBzZW1hcGhvcmUgcmVsZWFzZQorCSAqLworCWlm
IChyaW5nLT5mdW5jcy0+dm1odWIgPT0gQU1ER1BVX01NSFVCXzAgfHwgcmluZy0+ZnVuY3MtPnZt
aHViID09IEFNREdQVV9NTUhVQl8xKQorCQlhbWRncHVfcmluZ19lbWl0X3dyZWcocmluZywgdm1f
aW52X2VuZzBfc2VtICsgZW5nLCAwKTsKKworCXNwaW5fdW5sb2NrKCZhZGV2LT5nbWMuaW52YWxp
ZGF0ZV9sb2NrKTsKKwogCXJldHVybiBwZF9hZGRyOwogfQogCmRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9zZG1hX3Y0XzAuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L3NkbWFfdjRfMC5jCmluZGV4IDQ4MmQzZTIyNDA2Ny4uY2JhOGJmOTU4ZmM0IDEwMDY0NAot
LS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zZG1hX3Y0XzAuYworKysgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9zZG1hX3Y0XzAuYwpAQCAtMjIxMCw3ICsyMjEwLDkgQEAgc3Rh
dGljIGNvbnN0IHN0cnVjdCBhbWRncHVfcmluZ19mdW5jcyBzZG1hX3Y0XzBfcGFnZV9yaW5nX2Z1
bmNzID0gewogCQkvKiBzZG1hX3Y0XzBfcmluZ19lbWl0X3ZtX2ZsdXNoICovCiAJCVNPQzE1X0ZM
VVNIX0dQVV9UTEJfTlVNX1dSRUcgKiAzICsKIAkJU09DMTVfRkxVU0hfR1BVX1RMQl9OVU1fUkVH
X1dBSVQgKiA2ICsKLQkJMTAgKyAxMCArIDEwLCAvKiBzZG1hX3Y0XzBfcmluZ19lbWl0X2ZlbmNl
IHgzIGZvciB1c2VyIGZlbmNlLCB2bSBmZW5jZSAqLworCQkxMCArIDEwICsgMTAgKyAvKiBzZG1h
X3Y0XzBfcmluZ19lbWl0X2ZlbmNlIHgzIGZvciB1c2VyIGZlbmNlLCB2bSBmZW5jZSAqLworCQky
ICogKDMgKyA2KSwgLyogc2VtYXBob3JlIGFjcXVpcmUvcmVsZWFzZSBXQSBmb3IgbW1odWIgaW52
YWxpZGF0aW9uCisJCQkgICAgICAqIGFkZHMgbW9yZSBwYWNrZXRzIGluIGdtYyBmbHVzaCAqLwog
CS5lbWl0X2liX3NpemUgPSA3ICsgNiwgLyogc2RtYV92NF8wX3JpbmdfZW1pdF9pYiAqLwogCS5l
bWl0X2liID0gc2RtYV92NF8wX3JpbmdfZW1pdF9pYiwKIAkuZW1pdF9mZW5jZSA9IHNkbWFfdjRf
MF9yaW5nX2VtaXRfZmVuY2UsCkBAIC0yMjQyLDcgKzIyNDQsOSBAQCBzdGF0aWMgY29uc3Qgc3Ry
dWN0IGFtZGdwdV9yaW5nX2Z1bmNzIHNkbWFfdjRfMF9wYWdlX3JpbmdfZnVuY3NfMm5kX21taHVi
ID0gewogCQkvKiBzZG1hX3Y0XzBfcmluZ19lbWl0X3ZtX2ZsdXNoICovCiAJCVNPQzE1X0ZMVVNI
X0dQVV9UTEJfTlVNX1dSRUcgKiAzICsKIAkJU09DMTVfRkxVU0hfR1BVX1RMQl9OVU1fUkVHX1dB
SVQgKiA2ICsKLQkJMTAgKyAxMCArIDEwLCAvKiBzZG1hX3Y0XzBfcmluZ19lbWl0X2ZlbmNlIHgz
IGZvciB1c2VyIGZlbmNlLCB2bSBmZW5jZSAqLworCQkxMCArIDEwICsgMTAgKyAvKiBzZG1hX3Y0
XzBfcmluZ19lbWl0X2ZlbmNlIHgzIGZvciB1c2VyIGZlbmNlLCB2bSBmZW5jZSAqLworCQkyICog
KDMgKyA2KSwgLyogc2VtYXBob3JlIGFjcXVpcmUvcmVsZWFzZSBXQSBmb3IgbW1odWIgaW52YWxp
ZGF0aW9uCisJCQkgICAgICAqIGFkZHMgbW9yZSBwYWNrZXRzIGluIGdtYyBmbHVzaCAqLwogCS5l
bWl0X2liX3NpemUgPSA3ICsgNiwgLyogc2RtYV92NF8wX3JpbmdfZW1pdF9pYiAqLwogCS5lbWl0
X2liID0gc2RtYV92NF8wX3JpbmdfZW1pdF9pYiwKIAkuZW1pdF9mZW5jZSA9IHNkbWFfdjRfMF9y
aW5nX2VtaXRfZmVuY2UsCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS91
dmRfdjdfMC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdXZkX3Y3XzAuYwppbmRleCA4
YzJiMzFkNDAxN2UuLjBiZjQzODhkODk3NSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvdXZkX3Y3XzAuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS91dmRf
djdfMC5jCkBAIC0xNzg0LDcgKzE3ODQsOSBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGFtZGdwdV9y
aW5nX2Z1bmNzIHV2ZF92N18wX3Jpbmdfdm1fZnVuY3MgPSB7CiAJCVNPQzE1X0ZMVVNIX0dQVV9U
TEJfTlVNX1dSRUcgKiA2ICsKIAkJU09DMTVfRkxVU0hfR1BVX1RMQl9OVU1fUkVHX1dBSVQgKiA4
ICsKIAkJOCArIC8qIHV2ZF92N18wX3JpbmdfZW1pdF92bV9mbHVzaCAqLwotCQkxNCArIDE0LCAv
KiB1dmRfdjdfMF9yaW5nX2VtaXRfZmVuY2UgeDIgdm0gZmVuY2UgKi8KKwkJMTQgKyAxNCArIC8q
IHV2ZF92N18wX3JpbmdfZW1pdF9mZW5jZSB4MiB2bSBmZW5jZSAqLworCQkyICogKDYgKyA4KSwg
Lyogc2VtYXBob3JlIGFjcXVpcmUvcmVsZWFzZSBXQSBmb3IgbW1odWIgaW52YWxpZGF0aW9uCisJ
CQkgICAgICAqIGFkZHMgbW9yZSBwYWNrZXRzIGluIGdtYyBmbHVzaCAqLwogCS5lbWl0X2liX3Np
emUgPSA4LCAvKiB1dmRfdjdfMF9yaW5nX2VtaXRfaWIgKi8KIAkuZW1pdF9pYiA9IHV2ZF92N18w
X3JpbmdfZW1pdF9pYiwKIAkuZW1pdF9mZW5jZSA9IHV2ZF92N18wX3JpbmdfZW1pdF9mZW5jZSwK
QEAgLTE4MTcsNyArMTgxOSw5IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgYW1kZ3B1X3JpbmdfZnVu
Y3MgdXZkX3Y3XzBfZW5jX3Jpbmdfdm1fZnVuY3MgPSB7CiAJCVNPQzE1X0ZMVVNIX0dQVV9UTEJf
TlVNX1JFR19XQUlUICogNCArCiAJCTQgKyAvKiB1dmRfdjdfMF9lbmNfcmluZ19lbWl0X3ZtX2Zs
dXNoICovCiAJCTUgKyA1ICsgLyogdXZkX3Y3XzBfZW5jX3JpbmdfZW1pdF9mZW5jZSB4MiB2bSBm
ZW5jZSAqLwotCQkxLCAvKiB1dmRfdjdfMF9lbmNfcmluZ19pbnNlcnRfZW5kICovCisJCTEgKyAv
KiB1dmRfdjdfMF9lbmNfcmluZ19pbnNlcnRfZW5kICovCisJCTIgKiAoMyArIDQpLCAvKiBzZW1h
cGhvcmUgYWNxdWlyZS9yZWxlYXNlIFdBIGZvciBtbWh1YiBpbnZhbGlkYXRpb24KKwkJCSAgICAg
ICogYWRkcyBtb3JlIHBhY2tldHMgaW4gZ21jIGZsdXNoICovCiAJLmVtaXRfaWJfc2l6ZSA9IDUs
IC8qIHV2ZF92N18wX2VuY19yaW5nX2VtaXRfaWIgKi8KIAkuZW1pdF9pYiA9IHV2ZF92N18wX2Vu
Y19yaW5nX2VtaXRfaWIsCiAJLmVtaXRfZmVuY2UgPSB1dmRfdjdfMF9lbmNfcmluZ19lbWl0X2Zl
bmNlLApkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdmNlX3Y0XzAuYyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3ZjZV92NF8wLmMKaW5kZXggOTNkODBlZjE3Njg1
Li42OWFiYjliZmE2YmYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3Zj
ZV92NF8wLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdmNlX3Y0XzAuYwpAQCAt
MTA4MCw3ICsxMDgwLDkgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBhbWRncHVfcmluZ19mdW5jcyB2
Y2VfdjRfMF9yaW5nX3ZtX2Z1bmNzID0gewogCQlTT0MxNV9GTFVTSF9HUFVfVExCX05VTV9SRUdf
V0FJVCAqIDQgKwogCQk0ICsgLyogdmNlX3Y0XzBfZW1pdF92bV9mbHVzaCAqLwogCQk1ICsgNSAr
IC8qIGFtZGdwdV92Y2VfcmluZ19lbWl0X2ZlbmNlIHgyIHZtIGZlbmNlICovCi0JCTEsIC8qIHZj
ZV92NF8wX3JpbmdfaW5zZXJ0X2VuZCAqLworCQkxICsgLyogdmNlX3Y0XzBfcmluZ19pbnNlcnRf
ZW5kICovCisJCTIgKiAoMyArIDQpLCAvKiBzZW1hcGhvcmUgYWNxdWlyZS9yZWxlYXNlIFdBIGZv
ciBtbWh1YiBpbnZhbGlkYXRpb24KKwkJCSAgICAgICogYWRkcyBtb3JlIHBhY2tldHMgaW4gZ21j
IGZsdXNoICovCiAJLmVtaXRfaWJfc2l6ZSA9IDUsIC8qIHZjZV92NF8wX3JpbmdfZW1pdF9pYiAq
LwogCS5lbWl0X2liID0gdmNlX3Y0XzBfcmluZ19lbWl0X2liLAogCS5lbWl0X3ZtX2ZsdXNoID0g
dmNlX3Y0XzBfZW1pdF92bV9mbHVzaCwKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L3Zjbl92MV8wLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS92Y25fdjFfMC5j
CmluZGV4IGIyMzM2MjEwMmU1MS4uMjMyNzBkZWVhNzg4IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS92Y25fdjFfMC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L3Zjbl92MV8wLmMKQEAgLTIyMDksNyArMjIwOSw5IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qg
YW1kZ3B1X3JpbmdfZnVuY3MgdmNuX3YxXzBfZGVjX3Jpbmdfdm1fZnVuY3MgPSB7CiAJCVNPQzE1
X0ZMVVNIX0dQVV9UTEJfTlVNX1JFR19XQUlUICogOCArCiAJCTggKyAvKiB2Y25fdjFfMF9kZWNf
cmluZ19lbWl0X3ZtX2ZsdXNoICovCiAJCTE0ICsgMTQgKyAvKiB2Y25fdjFfMF9kZWNfcmluZ19l
bWl0X2ZlbmNlIHgyIHZtIGZlbmNlICovCi0JCTYsCisJCTYgKworCQkyICogKDYgKyA4KSwgLyog
c2VtYXBob3JlIGFjcXVpcmUvcmVsZWFzZSBXQSBmb3IgbW1odWIgaW52YWxpZGF0aW9uCisJCQkg
ICAgICAqIGFkZHMgbW9yZSBwYWNrZXRzIGluIGdtYyBmbHVzaCAqLwogCS5lbWl0X2liX3NpemUg
PSA4LCAvKiB2Y25fdjFfMF9kZWNfcmluZ19lbWl0X2liICovCiAJLmVtaXRfaWIgPSB2Y25fdjFf
MF9kZWNfcmluZ19lbWl0X2liLAogCS5lbWl0X2ZlbmNlID0gdmNuX3YxXzBfZGVjX3JpbmdfZW1p
dF9mZW5jZSwKQEAgLTIyNDIsNyArMjI0NCw5IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgYW1kZ3B1
X3JpbmdfZnVuY3MgdmNuX3YxXzBfZW5jX3Jpbmdfdm1fZnVuY3MgPSB7CiAJCVNPQzE1X0ZMVVNI
X0dQVV9UTEJfTlVNX1JFR19XQUlUICogNCArCiAJCTQgKyAvKiB2Y25fdjFfMF9lbmNfcmluZ19l
bWl0X3ZtX2ZsdXNoICovCiAJCTUgKyA1ICsgLyogdmNuX3YxXzBfZW5jX3JpbmdfZW1pdF9mZW5j
ZSB4MiB2bSBmZW5jZSAqLwotCQkxLCAvKiB2Y25fdjFfMF9lbmNfcmluZ19pbnNlcnRfZW5kICov
CisJCTEgKyAvKiB2Y25fdjFfMF9lbmNfcmluZ19pbnNlcnRfZW5kICovCisJCTIgKiAoMyArIDQp
LCAvKiBzZW1hcGhvcmUgYWNxdWlyZS9yZWxlYXNlIFdBIGZvciBtbWh1YiBpbnZhbGlkYXRpb24K
KwkJCSAgICAgICogYWRkcyBtb3JlIHBhY2tldHMgaW4gZ21jIGZsdXNoICovCiAJLmVtaXRfaWJf
c2l6ZSA9IDUsIC8qIHZjbl92MV8wX2VuY19yaW5nX2VtaXRfaWIgKi8KIAkuZW1pdF9pYiA9IHZj
bl92MV8wX2VuY19yaW5nX2VtaXRfaWIsCiAJLmVtaXRfZmVuY2UgPSB2Y25fdjFfMF9lbmNfcmlu
Z19lbWl0X2ZlbmNlLApAQCAtMjI3Niw3ICsyMjgwLDkgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBh
bWRncHVfcmluZ19mdW5jcyB2Y25fdjFfMF9qcGVnX3Jpbmdfdm1fZnVuY3MgPSB7CiAJCVNPQzE1
X0ZMVVNIX0dQVV9UTEJfTlVNX1JFR19XQUlUICogOCArCiAJCTggKyAvKiB2Y25fdjFfMF9qcGVn
X3JpbmdfZW1pdF92bV9mbHVzaCAqLwogCQkyNiArIDI2ICsgLyogdmNuX3YxXzBfanBlZ19yaW5n
X2VtaXRfZmVuY2UgeDIgdm0gZmVuY2UgKi8KLQkJNiwKKwkJNiArCisJCTIgKiAoNiArIDgpLCAv
KiBzZW1hcGhvcmUgYWNxdWlyZS9yZWxlYXNlIFdBIGZvciBtbWh1YiBpbnZhbGlkYXRpb24KKwkJ
CSAgICAgICogYWRkcyBtb3JlIHBhY2tldHMgaW4gZ21jIGZsdXNoICovCiAJLmVtaXRfaWJfc2l6
ZSA9IDIyLCAvKiB2Y25fdjFfMF9qcGVnX3JpbmdfZW1pdF9pYiAqLwogCS5lbWl0X2liID0gdmNu
X3YxXzBfanBlZ19yaW5nX2VtaXRfaWIsCiAJLmVtaXRfZmVuY2UgPSB2Y25fdjFfMF9qcGVnX3Jp
bmdfZW1pdF9mZW5jZSwKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3Zj
bl92Ml8wLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS92Y25fdjJfMC5jCmluZGV4IDE2
ZjE5MmY2Yzk2Ny4uODNjYzBkYTM3Y2I0IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS92Y25fdjJfMC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3Zjbl92
Ml8wLmMKQEAgLTIxNzEsNyArMjE3MSw5IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgYW1kZ3B1X3Jp
bmdfZnVuY3MgdmNuX3YyXzBfZGVjX3Jpbmdfdm1fZnVuY3MgPSB7CiAJCVNPQzE1X0ZMVVNIX0dQ
VV9UTEJfTlVNX1JFR19XQUlUICogOCArCiAJCTggKyAvKiB2Y25fdjJfMF9kZWNfcmluZ19lbWl0
X3ZtX2ZsdXNoICovCiAJCTE0ICsgMTQgKyAvKiB2Y25fdjJfMF9kZWNfcmluZ19lbWl0X2ZlbmNl
IHgyIHZtIGZlbmNlICovCi0JCTYsCisJCTYgKworCQkyICogKDYgKyA4KSwgLyogc2VtYXBob3Jl
IGFjcXVpcmUvcmVsZWFzZSBXQSBmb3IgbW1odWIgaW52YWxpZGF0aW9uCisJCQkgICAgICAqIGFk
ZHMgbW9yZSBwYWNrZXRzIGluIGdtYyBmbHVzaCAqLwogCS5lbWl0X2liX3NpemUgPSA4LCAvKiB2
Y25fdjJfMF9kZWNfcmluZ19lbWl0X2liICovCiAJLmVtaXRfaWIgPSB2Y25fdjJfMF9kZWNfcmlu
Z19lbWl0X2liLAogCS5lbWl0X2ZlbmNlID0gdmNuX3YyXzBfZGVjX3JpbmdfZW1pdF9mZW5jZSwK
QEAgLTIyMDIsNyArMjIwNCw5IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgYW1kZ3B1X3JpbmdfZnVu
Y3MgdmNuX3YyXzBfZW5jX3Jpbmdfdm1fZnVuY3MgPSB7CiAJCVNPQzE1X0ZMVVNIX0dQVV9UTEJf
TlVNX1JFR19XQUlUICogNCArCiAJCTQgKyAvKiB2Y25fdjJfMF9lbmNfcmluZ19lbWl0X3ZtX2Zs
dXNoICovCiAJCTUgKyA1ICsgLyogdmNuX3YyXzBfZW5jX3JpbmdfZW1pdF9mZW5jZSB4MiB2bSBm
ZW5jZSAqLwotCQkxLCAvKiB2Y25fdjJfMF9lbmNfcmluZ19pbnNlcnRfZW5kICovCisJCTEgKyAv
KiB2Y25fdjJfMF9lbmNfcmluZ19pbnNlcnRfZW5kICovCisJCTIgKiAoMyArIDQpLCAvKiBzZW1h
cGhvcmUgYWNxdWlyZS9yZWxlYXNlIFdBIGZvciBtbWh1YiBpbnZhbGlkYXRpb24KKwkJCSAgICAg
ICogYWRkcyBtb3JlIHBhY2tldHMgaW4gZ21jIGZsdXNoICovCiAJLmVtaXRfaWJfc2l6ZSA9IDUs
IC8qIHZjbl92Ml8wX2VuY19yaW5nX2VtaXRfaWIgKi8KIAkuZW1pdF9pYiA9IHZjbl92Ml8wX2Vu
Y19yaW5nX2VtaXRfaWIsCiAJLmVtaXRfZmVuY2UgPSB2Y25fdjJfMF9lbmNfcmluZ19lbWl0X2Zl
bmNlLApAQCAtMjIzMSw3ICsyMjM1LDkgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBhbWRncHVfcmlu
Z19mdW5jcyB2Y25fdjJfMF9qcGVnX3Jpbmdfdm1fZnVuY3MgPSB7CiAJCVNPQzE1X0ZMVVNIX0dQ
VV9UTEJfTlVNX1JFR19XQUlUICogOCArCiAJCTggKyAvKiB2Y25fdjJfMF9qcGVnX3JpbmdfZW1p
dF92bV9mbHVzaCAqLwogCQkxOCArIDE4ICsgLyogdmNuX3YyXzBfanBlZ19yaW5nX2VtaXRfZmVu
Y2UgeDIgdm0gZmVuY2UgKi8KLQkJOCArIDE2LAorCQk4ICsgMTYgKworCQkyICogKDYgKyA4KSwg
Lyogc2VtYXBob3JlIGFjcXVpcmUvcmVsZWFzZSBXQSBmb3IgbW1odWIgaW52YWxpZGF0aW9uCisJ
CQkgICAgICAqIGFkZHMgbW9yZSBwYWNrZXRzIGluIGdtYyBmbHVzaCAqLwogCS5lbWl0X2liX3Np
emUgPSAyMiwgLyogdmNuX3YyXzBfanBlZ19yaW5nX2VtaXRfaWIgKi8KIAkuZW1pdF9pYiA9IHZj
bl92Ml8wX2pwZWdfcmluZ19lbWl0X2liLAogCS5lbWl0X2ZlbmNlID0gdmNuX3YyXzBfanBlZ19y
aW5nX2VtaXRfZmVuY2UsCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS92
Y25fdjJfNS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdmNuX3YyXzUuYwppbmRleCBm
ZjZjYzc3YWQwYjAuLjgyYTE5MDE4NWJiYSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvdmNuX3YyXzUuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS92Y25f
djJfNS5jCkBAIC0xMDA4LDcgKzEwMDgsOSBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGFtZGdwdV9y
aW5nX2Z1bmNzIHZjbl92Ml81X2RlY19yaW5nX3ZtX2Z1bmNzID0gewogCQlTT0MxNV9GTFVTSF9H
UFVfVExCX05VTV9SRUdfV0FJVCAqIDggKwogCQk4ICsgLyogdmNuX3YyXzBfZGVjX3JpbmdfZW1p
dF92bV9mbHVzaCAqLwogCQkxNCArIDE0ICsgLyogdmNuX3YyXzBfZGVjX3JpbmdfZW1pdF9mZW5j
ZSB4MiB2bSBmZW5jZSAqLwotCQk2LAorCQk2ICsKKwkJMiAqICg2ICsgOCksIC8qIHNlbWFwaG9y
ZSBhY3F1aXJlL3JlbGVhc2UgV0EgZm9yIG1taHViIGludmFsaWRhdGlvbgorCQkJICAgICAgKiBh
ZGRzIG1vcmUgcGFja2V0cyBpbiBnbWMgZmx1c2ggKi8KIAkuZW1pdF9pYl9zaXplID0gOCwgLyog
dmNuX3YyXzBfZGVjX3JpbmdfZW1pdF9pYiAqLwogCS5lbWl0X2liID0gdmNuX3YyXzBfZGVjX3Jp
bmdfZW1pdF9pYiwKIAkuZW1pdF9mZW5jZSA9IHZjbl92Ml8wX2RlY19yaW5nX2VtaXRfZmVuY2Us
CkBAIC0xMTA4LDcgKzExMTAsOSBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGFtZGdwdV9yaW5nX2Z1
bmNzIHZjbl92Ml81X2VuY19yaW5nX3ZtX2Z1bmNzID0gewogCQlTT0MxNV9GTFVTSF9HUFVfVExC
X05VTV9SRUdfV0FJVCAqIDQgKwogCQk0ICsgLyogdmNuX3YyXzBfZW5jX3JpbmdfZW1pdF92bV9m
bHVzaCAqLwogCQk1ICsgNSArIC8qIHZjbl92Ml8wX2VuY19yaW5nX2VtaXRfZmVuY2UgeDIgdm0g
ZmVuY2UgKi8KLQkJMSwgLyogdmNuX3YyXzBfZW5jX3JpbmdfaW5zZXJ0X2VuZCAqLworCQkxICsg
LyogdmNuX3YyXzBfZW5jX3JpbmdfaW5zZXJ0X2VuZCAqLworCQkyICogKDMgKyA0KSwgLyogc2Vt
YXBob3JlIGFjcXVpcmUvcmVsZWFzZSBXQSBmb3IgbW1odWIgaW52YWxpZGF0aW9uCisJCQkgICAg
ICAqIGFkZHMgbW9yZSBwYWNrZXRzIGluIGdtYyBmbHVzaCAqLwogCS5lbWl0X2liX3NpemUgPSA1
LCAvKiB2Y25fdjJfMF9lbmNfcmluZ19lbWl0X2liICovCiAJLmVtaXRfaWIgPSB2Y25fdjJfMF9l
bmNfcmluZ19lbWl0X2liLAogCS5lbWl0X2ZlbmNlID0gdmNuX3YyXzBfZW5jX3JpbmdfZW1pdF9m
ZW5jZSwKQEAgLTExODcsNyArMTE5MSw5IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgYW1kZ3B1X3Jp
bmdfZnVuY3MgdmNuX3YyXzVfanBlZ19yaW5nX3ZtX2Z1bmNzID0gewogCQlTT0MxNV9GTFVTSF9H
UFVfVExCX05VTV9SRUdfV0FJVCAqIDggKwogCQk4ICsgLyogdmNuX3YyXzBfanBlZ19yaW5nX2Vt
aXRfdm1fZmx1c2ggKi8KIAkJMTggKyAxOCArIC8qIHZjbl92Ml8wX2pwZWdfcmluZ19lbWl0X2Zl
bmNlIHgyIHZtIGZlbmNlICovCi0JCTggKyAxNiwKKwkJOCArIDE2ICsKKwkJMiAqICg2ICsgOCks
IC8qIHNlbWFwaG9yZSBhY3F1aXJlL3JlbGVhc2UgV0EgZm9yIG1taHViIGludmFsaWRhdGlvbgor
CQkJICAgICAgKiBhZGRzIG1vcmUgcGFja2V0cyBpbiBnbWMgZmx1c2ggKi8KIAkuZW1pdF9pYl9z
aXplID0gMjIsIC8qIHZjbl92Ml8wX2pwZWdfcmluZ19lbWl0X2liICovCiAJLmVtaXRfaWIgPSB2
Y25fdjJfMF9qcGVnX3JpbmdfZW1pdF9pYiwKIAkuZW1pdF9mZW5jZSA9IHZjbl92Ml8wX2pwZWdf
cmluZ19lbWl0X2ZlbmNlLAotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2FtZC1nZng=
