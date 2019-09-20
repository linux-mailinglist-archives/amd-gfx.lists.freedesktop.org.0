Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AB86B8966
	for <lists+amd-gfx@lfdr.de>; Fri, 20 Sep 2019 04:36:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F07D46F56F;
	Fri, 20 Sep 2019 02:36:42 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730063.outbound.protection.outlook.com [40.107.73.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3B136F56F
 for <amd-gfx@lists.freedesktop.org>; Fri, 20 Sep 2019 02:36:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B8ay3Ul+34ZJHDQSJXR37PMT/BplKrpGz3g/PJk9LIbbpw0od3bGtezbUw7/a0a8bRiKfOkwHlFJh5N5kMidou2/n9SBETK6tpbaq4oxTS1ITBJFYGW3sd3kRkYjOvTxpehbB3KsjFS5TCU94IKHsySHpWsSphxC98XqQU5pNUmK2nG2okgEO6mqphg7yze2mbCquWdX0UPFN1s7MYT+hWX8zntCxz3RdA6iVCgCE6gL10jxVuNwD1n2JX0IEg2ZAfmI3KDDSYbdc5VJ1hhEVGw5PgWQLsvQmsaUaFRP+vkhYAh7bvN9i/q37/pwZ8j+ehCjHYSEOUQS6j2qimkuBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QkSnMyflDIYBiiMVt/DpMIzC4cYahwRk1TY6ysfEMLs=;
 b=bjLpqqu4xvHJaM4y3O5u1zxP3dis7RNTFKeqBls8iymUmHmEl/btcC+ONhjyqxI8ahNG/d5RbmofLn8iFyD2TjXjDNKiWhAyBVq/7wUA82Ya7/0Ez3TqUgF2X92878Prd0D8Zr3bimTc9AJo2fkjwG503bZkp3s6uS1IrI9JO2Ioi8ffwGh72f4GOwAWw3dDLurl47nPjS7wVEEEKKspGabsG10AQw/oRk55Su7cuPu82+YPbP2gwSIyOhQgaXHPTQogmJKf6phZ0Y2WTJxYv4VqEDY+KXGmLV4Xbe3eFAyNepsOawAKGQFXtN6kuSdQz4V05GrhBMKqeSByYilLzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM5PR12CA0019.namprd12.prod.outlook.com (2603:10b6:4:1::29) by
 CH2PR12MB4118.namprd12.prod.outlook.com (2603:10b6:610:a4::23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.19; Fri, 20 Sep 2019 02:36:39 +0000
Received: from CO1NAM03FT025.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::200) by DM5PR12CA0019.outlook.office365.com
 (2603:10b6:4:1::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2284.20 via Frontend
 Transport; Fri, 20 Sep 2019 02:36:39 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT025.mail.protection.outlook.com (10.152.80.163) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2284.20 via Frontend Transport; Fri, 20 Sep 2019 02:36:38 +0000
Received: from Build-machine.amd.com (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Thu, 19 Sep 2019 21:36:37 -0500
From: Jesse Zhang <zhexi.zhang@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v6] drm/amd/amdgpu:Fix compute ring unable to detect hang.
Date: Fri, 20 Sep 2019 10:36:19 +0800
Message-ID: <1568946979-5824-1-git-send-email-zhexi.zhang@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1568880041-19830-1-git-send-email-zhexi.zhang@amd.com>
References: <1568880041-19830-1-git-send-email-zhexi.zhang@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(39860400002)(136003)(376002)(396003)(428003)(199004)(189003)(70206006)(51416003)(70586007)(7696005)(76176011)(47776003)(53416004)(186003)(5660300002)(26005)(6916009)(6666004)(356004)(305945005)(50466002)(486006)(336012)(48376002)(11346002)(2616005)(476003)(126002)(316002)(426003)(446003)(16586007)(4326008)(50226002)(8936002)(478600001)(86362001)(81156014)(81166006)(36756003)(14444005)(8676002)(2351001)(2906002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CH2PR12MB4118; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 00bb8fd7-243a-4ad0-25e9-08d73d735d04
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328);
 SRVR:CH2PR12MB4118; 
X-MS-TrafficTypeDiagnostic: CH2PR12MB4118:
X-Microsoft-Antispam-PRVS: <CH2PR12MB41185CA4FC3CE8F0FB538C2AEF880@CH2PR12MB4118.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-Forefront-PRVS: 0166B75B74
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: yuRbkjEt+61+NtWY07gaiStY00sb1VHV7FYRLvMFeLXjj4DvLIiwzu23+rRrNEsRN1Zo/oAtlALO8zx9UhdBfrLTZ+X24dFRMmixTjO4UrJp16JaNQHOXJSuZZGTZCtCHJ44MQGhpRCY0lVuxatWZlL1OZ5kpFdwQ0LWOfYPwUzErjDeaL4sfUBstWp1AXyXAORLwFpCkVLXMITifoxXNlyyxcingexuW9KqAVNyooyk1A+j2DeYKheX79fnYtz/vt5GnFeJrL4L1qv6gOoSUKelUZbAlqAIsZpfy3nTEB1z0Dh+Tmm7vLtiyALX0cwyrlujxZQu9FQ08nZ9j+2X9bqNOLL9Yzi4F/fffYOjs7aQN0sbKrBqimD5kvKDnNhIfp4VzNSUCXKWeBgMEpTWnF4l7HP7PL9lJ/V44fcQ6mM=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2019 02:36:38.4288 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 00bb8fd7-243a-4ad0-25e9-08d73d735d04
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4118
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QkSnMyflDIYBiiMVt/DpMIzC4cYahwRk1TY6ysfEMLs=;
 b=M59qspmO660ksh7ONFPwHJ4DiMyNXrkXzA0wy1l6sVuZQlq85vMQps6td9ewA2DfG8kivPeoWbYXrUrT9iSVVNJ6caRD9F/P90S/y7SScZQ2v5/y65nqog3O0GKETKDrOgOMYH/s03hVzSm80kLagcRNrWEa9Ar1aaPNiLF+gwg=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is
 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=permerror action=none
 header.from=amd.com;
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
Cc: Jesse Zhang <zhexi.zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

V2hlbiBjb21wdXRlIGZlbmNlIGRpZCBzaWduYWwsIGNvbXB1dGUgcmluZyBjYW5ub3QgZGV0ZWN0
IGhhcmR3YXJlIGhhbmcKYmVjYXVzZSBpdHMgdGltZW91dCB2YWx1ZSBpcyBzZXQgdG8gYmUgaW5m
aW5pdGUgYnkgZGVmYXVsdC4KCkluIFNSLUlPViBhbmQgcGFzc3Rocm91Z2ggbW9kZSwgaWYgdXNl
ciBkb2VzIG5vdCBkZWNsYXJlIGN1c3RvbWUgdGltZW91dAp2YWx1ZSBmb3IgY29tcHV0ZSByaW5n
LCB0aGVuIHVzZSBnZnggcmluZyB0aW1lb3V0IHZhbHVlIGFzIGRlZmF1bHQuIFNvCnRoYXQgd2hl
biB0aGVyZSBpcyBhIHR1cmUgaGFyZHdhcmUgaGFuZywgY29tcHV0ZSByaW5nIGNhbiBkZXRlY3Qg
aXQuCgpDaGFuZ2UtSWQ6IEk3OTRlYzA4NjhjNmMwYWFkNDA3NzQ5NDU3MjYwZWNmZWUwNjE3YzEw
ClNpZ25lZC1vZmYtYnk6IEplc3NlIFpoYW5nIDx6aGV4aS56aGFuZ0BhbWQuY29tPgotLS0KIGRy
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYyB8IDEyICsrKysrKy0tLS0t
LQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5jICAgIHwgIDQgKysrLQog
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2ZlbmNlLmMgIHwgMTMgKy0tLS0tLS0t
LS0tLQogMyBmaWxlcyBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCAxOSBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMKaW5kZXggM2I1Mjgy
Yi4uMDNhYzVhMWRhIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfZGV2aWNlLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rldmlj
ZS5jCkBAIC0xMDI0LDEyICsxMDI0LDYgQEAgc3RhdGljIGludCBhbWRncHVfZGV2aWNlX2NoZWNr
X2FyZ3VtZW50cyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKIAogCWFtZGdwdV9kZXZpY2Vf
Y2hlY2tfYmxvY2tfc2l6ZShhZGV2KTsKIAotCXJldCA9IGFtZGdwdV9kZXZpY2VfZ2V0X2pvYl90
aW1lb3V0X3NldHRpbmdzKGFkZXYpOwotCWlmIChyZXQpIHsKLQkJZGV2X2VycihhZGV2LT5kZXYs
ICJpbnZhbGlkIGxvY2t1cF90aW1lb3V0IHBhcmFtZXRlciBzeW50YXhcbiIpOwotCQlyZXR1cm4g
cmV0OwotCX0KLQogCWFkZXYtPmZpcm13YXJlLmxvYWRfdHlwZSA9IGFtZGdwdV91Y29kZV9nZXRf
bG9hZF90eXBlKGFkZXYsIGFtZGdwdV9md19sb2FkX3R5cGUpOwogCiAJcmV0dXJuIHJldDsKQEAg
LTI3MzIsNiArMjcyNiwxMiBAQCBpbnQgYW1kZ3B1X2RldmljZV9pbml0KHN0cnVjdCBhbWRncHVf
ZGV2aWNlICphZGV2LAogCWlmIChyKQogCQlyZXR1cm4gcjsKIAorCXIgPSBhbWRncHVfZGV2aWNl
X2dldF9qb2JfdGltZW91dF9zZXR0aW5ncyhhZGV2KTsKKwlpZiAocikgeworCQlkZXZfZXJyKGFk
ZXYtPmRldiwgImludmFsaWQgbG9ja3VwX3RpbWVvdXQgcGFyYW1ldGVyIHN5bnRheFxuIik7CisJ
CXJldHVybiByOworCX0KKwogCS8qIGRvb3JiZWxsIGJhciBtYXBwaW5nIGFuZCBkb29yYmVsbCBp
bmRleCBpbml0Ki8KIAlhbWRncHVfZGV2aWNlX2Rvb3JiZWxsX2luaXQoYWRldik7CiAKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kcnYuYyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kcnYuYwppbmRleCA0MjA4ODhlLi4xMjM2MjQ1IDEw
MDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZHJ2LmMKKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5jCkBAIC0xMzc4LDEwICsxMzc4
LDEyIEBAIGludCBhbWRncHVfZGV2aWNlX2dldF9qb2JfdGltZW91dF9zZXR0aW5ncyhzdHJ1Y3Qg
YW1kZ3B1X2RldmljZSAqYWRldikKIAkJfQogCQkvKgogCQkgKiBUaGVyZSBpcyBvbmx5IG9uZSB2
YWx1ZSBzcGVjaWZpZWQgYW5kCi0JCSAqIGl0IHNob3VsZCBhcHBseSB0byBhbGwgbm9uLWNvbXB1
dGUgam9icy4KKwkJICogaXQgc2hvdWxkIGFwcGx5IHRvIGFsbCBqb2JzLgogCQkgKi8KIAkJaWYg
KGluZGV4ID09IDEpCiAJCQlhZGV2LT5zZG1hX3RpbWVvdXQgPSBhZGV2LT52aWRlb190aW1lb3V0
ID0gYWRldi0+Z2Z4X3RpbWVvdXQ7CisJCQlpZiAoYW1kZ3B1X3NyaW92X3ZmKGFkZXYpIHx8IGFt
ZGdwdV9wYXNzdGhyb3VnaChhZGV2KSkKKwkJCQlhZGV2LT5jb21wdXRlX3RpbWVvdXQgPSBhZGV2
LT5nZnhfdGltZW91dDsKIAl9CiAKIAlyZXR1cm4gcmV0OwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2ZlbmNlLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfZmVuY2UuYwppbmRleCBjYmNhYTdjLi45ZWY1M2NhIDEwMDY0NAotLS0gYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZmVuY2UuYworKysgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZmVuY2UuYwpAQCAtNDYwLDE4ICs0NjAsNyBAQCBpbnQg
YW1kZ3B1X2ZlbmNlX2RyaXZlcl9pbml0X3Jpbmcoc3RydWN0IGFtZGdwdV9yaW5nICpyaW5nLAog
CQkJdGltZW91dCA9IGFkZXYtPmdmeF90aW1lb3V0OwogCQkJYnJlYWs7CiAJCWNhc2UgQU1ER1BV
X1JJTkdfVFlQRV9DT01QVVRFOgotCQkJLyoKLQkJCSAqIEZvciBub24tc3Jpb3YgY2FzZSwgbm8g
dGltZW91dCBlbmZvcmNlCi0JCQkgKiBvbiBjb21wdXRlIHJpbmcgYnkgZGVmYXVsdC4gVW5sZXNz
IHVzZXIKLQkJCSAqIHNwZWNpZmllcyBhIHRpbWVvdXQgZm9yIGNvbXB1dGUgcmluZy4KLQkJCSAq
Ci0JCQkgKiBGb3Igc3Jpb3YgY2FzZSwgYWx3YXlzIHVzZSB0aGUgdGltZW91dAotCQkJICogYXMg
Z2Z4IHJpbmcKLQkJCSAqLwotCQkJaWYgKCFhbWRncHVfc3Jpb3ZfdmYocmluZy0+YWRldikpCi0J
CQkJdGltZW91dCA9IGFkZXYtPmNvbXB1dGVfdGltZW91dDsKLQkJCWVsc2UKLQkJCQl0aW1lb3V0
ID0gYWRldi0+Z2Z4X3RpbWVvdXQ7CisJCQl0aW1lb3V0ID0gYWRldi0+Y29tcHV0ZV90aW1lb3V0
OwogCQkJYnJlYWs7CiAJCWNhc2UgQU1ER1BVX1JJTkdfVFlQRV9TRE1BOgogCQkJdGltZW91dCA9
IGFkZXYtPnNkbWFfdGltZW91dDsKLS0gCjIuNy40CgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2FtZC1nZng=
