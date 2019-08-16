Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E00758FE9F
	for <lists+amd-gfx@lfdr.de>; Fri, 16 Aug 2019 10:59:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78E9A8989C;
	Fri, 16 Aug 2019 08:59:44 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750088.outbound.protection.outlook.com [40.107.75.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A9618989C
 for <amd-gfx@lists.freedesktop.org>; Fri, 16 Aug 2019 08:59:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J9uMcCTIMkkR64pFGqlN0vUZxqz3ADGJzu6/foIOsDHkXeQ1Z5dGT2xeJM22QBAykTzlWyQFCz0/sc5c2brDYdwQtkJ+KBdURmTkSknX9sZu07Ndufct6BFBkEzGiuWxWZj3OF1imeBQgaQh9sy2PEK9fR0KiPj+VMdRkosvyKqBL9n27jUur7d46YP0qVdesUlqZBhRLC8TCPonk4w1Wtcm0Dd2uBlRa3xYe6+Mj0EfzSQjypW7L1XHRzEOvDG5tV09NF4paVT7T2rkpe4VfIu2TwGBIkVht+ti5UxF9vhdHvPYa4Kc+aZEMJMFPvo3O376cT/xd8zgtTxa36IA/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fcFQA56UKQjlyCrEpfjo45GqqDU3RYJiyhxZKRyhWKw=;
 b=Js1V8Q2gmRKGGCrWWy1MfMZbmsQD6Rnfg4aL38Rm0M2hqPrbgv0Ys8fdrhZOSipiQ3Pwe2mHjLO70IODJ2doTutDEGNzP7Qie6P+AHf7DKW2oWJbOd5/S3KSaCTiSPf7aGieaNR7/0eFOxFiUs/ITRtkx9UfYM2qQNKmxJ/Oeo19YVqxWqgrRnbgg2jVici9WKmBqKAtGr/NMvOR9q8Rzs2MHRbieJYabVVmC6GbRAmodub17zdXdLFoov48UI1ljr1SBjmYfl1yWmL35FEwyr2CtKgWahlmTdAONxYQCcsDG6oWgzfu+J5zFK4C3eXs7kgGhebhpSgmwjngC26aGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM3PR12CA0122.namprd12.prod.outlook.com (2603:10b6:0:51::18) by
 DM5PR12MB1532.namprd12.prod.outlook.com (2603:10b6:4:6::23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.18; Fri, 16 Aug 2019 08:59:40 +0000
Received: from DM3NAM03FT035.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::208) by DM3PR12CA0122.outlook.office365.com
 (2603:10b6:0:51::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2178.16 via Frontend
 Transport; Fri, 16 Aug 2019 08:59:40 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 DM3NAM03FT035.mail.protection.outlook.com (10.152.82.188) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2178.16 via Frontend Transport; Fri, 16 Aug 2019 08:59:39 +0000
Received: from gigabyte-debug.amd.com (10.34.1.3) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Fri, 16 Aug 2019
 03:59:38 -0500
From: Frank.Min <Frank.Min@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 3/3] amd/amdgpu: seperate sriov fb aperture setting
Date: Fri, 16 Aug 2019 16:59:20 +0800
Message-ID: <1565945960-21236-3-git-send-email-Frank.Min@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1565945960-21236-1-git-send-email-Frank.Min@amd.com>
References: <1565945960-21236-1-git-send-email-Frank.Min@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(39850400004)(396003)(346002)(376002)(2980300002)(428003)(189003)(199004)(47776003)(4326008)(70206006)(8676002)(70586007)(8936002)(50226002)(478600001)(53936002)(81166006)(16586007)(81156014)(36756003)(316002)(2906002)(7696005)(86362001)(76176011)(2351001)(126002)(5660300002)(6916009)(476003)(51416003)(11346002)(426003)(305945005)(336012)(446003)(186003)(53416004)(6666004)(2616005)(486006)(50466002)(356004)(48376002)(26005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1532; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 59e9c6cd-5bcb-4084-57a7-08d722281274
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:DM5PR12MB1532; 
X-MS-TrafficTypeDiagnostic: DM5PR12MB1532:
X-Microsoft-Antispam-PRVS: <DM5PR12MB15327C7B40D2FC8B4402B04FE9AF0@DM5PR12MB1532.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3044;
X-Forefront-PRVS: 0131D22242
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: cwEaRmm2VFtCcW23w82pibPeFOQ/YKi2AixOi7U9XUvSsbCqxmA8Tt8YWsL70cU2VlhUcLT6usmR0Carl0XLYGhoRbuLwauwf7rO2xzLmAo/CX6xJbqNn39Nm1uO69jSXJiltzOnVym1zBeN+Z9UxOMicIE1r3Goiqf/5JpcLQgRl2PEG12/Stt4YmhnltaoHzCNJ2LzkYpjOXVhAqXixmQo+Js5M1Xa4DYwfj/nAyI6qCA2oflzPhpyv3Y1V6CZUfigY6W6WyRc2AqXuyP8udBjk/Q2LxFLEVqa/752ob87I2DH6U+FBWa0xi9dCuK+Pf6B8abLZFI3kGexMiBmwHkGtHDeeDGlmwr+N11d61qa6SUbaeh4act01K5DPmkh+LEwNBB6RUkqviXbevSdhm+7BxOQ/PhiWXTvUqiNIkU=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2019 08:59:39.8934 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 59e9c6cd-5bcb-4084-57a7-08d722281274
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1532
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fcFQA56UKQjlyCrEpfjo45GqqDU3RYJiyhxZKRyhWKw=;
 b=ICDpykiP7lMkTE9QpcKK9A6WMLoKd7hNelKGpeZBGY7ZX2kQ+CJcjDmf84f2ZjFNikfWUunIJs/FXVYwwk67TdWqHTLZjeqfWFg+jAYAaXq1Crv0feQWLeFU2ZaFGB+IgsK5NyZGH6+paHr+Ej9R0X+1LiKotEcBc++w31I5FmU=
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
Cc: "Frank.Min" <Frank.Min@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

c3Jpb3Ygd291bGQgbm90IHVzZSBhZ3AsIHNvIHNlcGVyYXRlIHRoZSBmYiBhcGVydHVyZSBzZXR0
aW5nLgoKQ2hhbmdlLUlkOiBJMTM3MmNkMzU1MzI2NzMxYTMxMzYxYmZmMTNkNzllMTIxMjFiODY1
MQpTaWduZWQtb2ZmLWJ5OiBGcmFuay5NaW4gPEZyYW5rLk1pbkBhbWQuY29tPgotLS0KIGRyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeGh1Yl92MV8wLmMgfCAzOSArKysrKysrKysrKysrKysr
KysrKy0tLS0tLS0tLS0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y5XzAuYyAg
ICB8IDEyICsrKysrLS0tLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L21taHViX3Y5XzQu
YyAgfCAyNyArKysrKysrKysrKysrKystLS0tLS0tCiAzIGZpbGVzIGNoYW5nZWQsIDQ5IGluc2Vy
dGlvbnMoKyksIDI5IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2dmeGh1Yl92MV8wLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnho
dWJfdjFfMC5jCmluZGV4IDZjZTM3Y2UuLmVjNzhjOGIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2dmeGh1Yl92MV8wLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvZ2Z4aHViX3YxXzAuYwpAQCAtNzUsMjMgKzc1LDMyIEBAIHN0YXRpYyB2b2lkIGdmeGh1
Yl92MV8wX2luaXRfc3lzdGVtX2FwZXJ0dXJlX3JlZ3Moc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFk
ZXYpCiAJV1JFRzMyX1NPQzE1X1JMQyhHQywgMCwgbW1NQ19WTV9BR1BfQk9ULCBhZGV2LT5nbWMu
YWdwX3N0YXJ0ID4+IDI0KTsKIAlXUkVHMzJfU09DMTVfUkxDKEdDLCAwLCBtbU1DX1ZNX0FHUF9U
T1AsIGFkZXYtPmdtYy5hZ3BfZW5kID4+IDI0KTsKIAotCS8qIFByb2dyYW0gdGhlIHN5c3RlbSBh
cGVydHVyZSBsb3cgbG9naWNhbCBwYWdlIG51bWJlci4gKi8KLQlXUkVHMzJfU09DMTVfUkxDKEdD
LCAwLCBtbU1DX1ZNX1NZU1RFTV9BUEVSVFVSRV9MT1dfQUREUiwKLQkJICAgICBtaW4oYWRldi0+
Z21jLmZiX3N0YXJ0LCBhZGV2LT5nbWMuYWdwX3N0YXJ0KSA+PiAxOCk7CisJaWYgKGFtZGdwdV9z
cmlvdl92ZihhZGV2KSkgeworCQkvKiBQcm9ncmFtIHRoZSBzeXN0ZW0gYXBlcnR1cmUgbG93IGxv
Z2ljYWwgcGFnZSBudW1iZXIuICovCisJCVdSRUczMl9TT0MxNV9STEMoR0MsIDAsIG1tTUNfVk1f
U1lTVEVNX0FQRVJUVVJFX0xPV19BRERSLAorCQkJCSBhZGV2LT5nbWMuZmJfc3RhcnQgPj4gMTgp
OwogCi0JaWYgKGFkZXYtPmFzaWNfdHlwZSA9PSBDSElQX1JBVkVOICYmIGFkZXYtPnJldl9pZCA+
PSAweDgpCi0JCS8qCi0JCSAqIFJhdmVuMiBoYXMgYSBIVyBpc3N1ZSB0aGF0IGl0IGlzIHVuYWJs
ZSB0byB1c2UgdGhlIHZyYW0gd2hpY2gKLQkJICogaXMgb3V0IG9mIE1DX1ZNX1NZU1RFTV9BUEVS
VFVSRV9ISUdIX0FERFIuIFNvIGhlcmUgaXMgdGhlCi0JCSAqIHdvcmthcm91bmQgdGhhdCBpbmNy
ZWFzZSBzeXN0ZW0gYXBlcnR1cmUgaGlnaCBhZGRyZXNzIChhZGQgMSkKLQkJICogdG8gZ2V0IHJp
ZCBvZiB0aGUgVk0gZmF1bHQgYW5kIGhhcmR3YXJlIGhhbmcuCi0JCSAqLwogCQlXUkVHMzJfU09D
MTVfUkxDKEdDLCAwLCBtbU1DX1ZNX1NZU1RFTV9BUEVSVFVSRV9ISUdIX0FERFIsCi0JCQkgICAg
IG1heCgoYWRldi0+Z21jLmZiX2VuZCA+PiAxOCkgKyAweDEsCi0JCQkJIGFkZXYtPmdtYy5hZ3Bf
ZW5kID4+IDE4KSk7Ci0JZWxzZQotCQlXUkVHMzJfU09DMTVfUkxDKEdDLCAwLCBtbU1DX1ZNX1NZ
U1RFTV9BUEVSVFVSRV9ISUdIX0FERFIsCi0JCQkgICAgIG1heChhZGV2LT5nbWMuZmJfZW5kLCBh
ZGV2LT5nbWMuYWdwX2VuZCkgPj4gMTgpOworCQkJCSBhZGV2LT5nbWMuZmJfZW5kID4+IDE4KTsK
Kwl9IGVsc2UgeworCQkvKiBQcm9ncmFtIHRoZSBzeXN0ZW0gYXBlcnR1cmUgbG93IGxvZ2ljYWwg
cGFnZSBudW1iZXIuICovCisJCVdSRUczMl9TT0MxNV9STEMoR0MsIDAsIG1tTUNfVk1fU1lTVEVN
X0FQRVJUVVJFX0xPV19BRERSLAorCQkJICAgICBtaW4oYWRldi0+Z21jLmZiX3N0YXJ0LCBhZGV2
LT5nbWMuYWdwX3N0YXJ0KSA+PiAxOCk7CisKKwkJaWYgKGFkZXYtPmFzaWNfdHlwZSA9PSBDSElQ
X1JBVkVOICYmIGFkZXYtPnJldl9pZCA+PSAweDgpCisJCQkvKgorCQkJICogUmF2ZW4yIGhhcyBh
IEhXIGlzc3VlIHRoYXQgaXQgaXMgdW5hYmxlIHRvIHVzZSB0aGUgdnJhbSB3aGljaAorCQkJICog
aXMgb3V0IG9mIE1DX1ZNX1NZU1RFTV9BUEVSVFVSRV9ISUdIX0FERFIuIFNvIGhlcmUgaXMgdGhl
CisJCQkgKiB3b3JrYXJvdW5kIHRoYXQgaW5jcmVhc2Ugc3lzdGVtIGFwZXJ0dXJlIGhpZ2ggYWRk
cmVzcyAoYWRkIDEpCisJCQkgKiB0byBnZXQgcmlkIG9mIHRoZSBWTSBmYXVsdCBhbmQgaGFyZHdh
cmUgaGFuZy4KKwkJCSAqLworCQkJV1JFRzMyX1NPQzE1X1JMQyhHQywgMCwgbW1NQ19WTV9TWVNU
RU1fQVBFUlRVUkVfSElHSF9BRERSLAorCQkJCSAgICAgbWF4KChhZGV2LT5nbWMuZmJfZW5kID4+
IDE4KSArIDB4MSwKKwkJCQkJIGFkZXYtPmdtYy5hZ3BfZW5kID4+IDE4KSk7CisJCWVsc2UKKwkJ
CVdSRUczMl9TT0MxNV9STEMoR0MsIDAsIG1tTUNfVk1fU1lTVEVNX0FQRVJUVVJFX0hJR0hfQURE
UiwKKwkJCQkgICAgIG1heChhZGV2LT5nbWMuZmJfZW5kLCBhZGV2LT5nbWMuYWdwX2VuZCkgPj4g
MTgpOworCX0KIAogCS8qIFNldCBkZWZhdWx0IHBhZ2UgYWRkcmVzcy4gKi8KIAl2YWx1ZSA9IGFk
ZXYtPnZyYW1fc2NyYXRjaC5ncHVfYWRkciAtIGFkZXYtPmdtYy52cmFtX3N0YXJ0CmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjlfMC5jIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvZ21jX3Y5XzAuYwppbmRleCA2ZGUxNzI2Li4xZjhiZGZhIDEwMDY0NAot
LS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjlfMC5jCisrKyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OV8wLmMKQEAgLTkyMCwxMiArOTIwLDEyIEBAIHN0YXRp
YyB2b2lkIGdtY192OV8wX3ZyYW1fZ3R0X2xvY2F0aW9uKHN0cnVjdCBhbWRncHVfZGV2aWNlICph
ZGV2LAogCQkJCQlzdHJ1Y3QgYW1kZ3B1X2dtYyAqbWMpCiB7CiAJdTY0IGJhc2UgPSAwOwotCWlm
ICghYW1kZ3B1X3NyaW92X3ZmKGFkZXYpKSB7Ci0JCWlmIChhZGV2LT5hc2ljX3R5cGUgPT0gQ0hJ
UF9BUkNUVVJVUykKLQkJCWJhc2UgPSBtbWh1Yl92OV80X2dldF9mYl9sb2NhdGlvbihhZGV2KTsK
LQkJZWxzZQotCQkJYmFzZSA9IG1taHViX3YxXzBfZ2V0X2ZiX2xvY2F0aW9uKGFkZXYpOwotCX0K
KworCWlmIChhZGV2LT5hc2ljX3R5cGUgPT0gQ0hJUF9BUkNUVVJVUykKKwkJYmFzZSA9IG1taHVi
X3Y5XzRfZ2V0X2ZiX2xvY2F0aW9uKGFkZXYpOworCWVsc2UKKwkJYmFzZSA9IG1taHViX3YxXzBf
Z2V0X2ZiX2xvY2F0aW9uKGFkZXYpOworCiAJLyogYWRkIHRoZSB4Z21pIG9mZnNldCBvZiB0aGUg
cGh5c2ljYWwgbm9kZSAqLwogCWJhc2UgKz0gYWRldi0+Z21jLnhnbWkucGh5c2ljYWxfbm9kZV9p
ZCAqIGFkZXYtPmdtYy54Z21pLm5vZGVfc2VnbWVudF9zaXplOwogCWFtZGdwdV9nbWNfdnJhbV9s
b2NhdGlvbihhZGV2LCBtYywgYmFzZSk7CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9tbWh1Yl92OV80LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9tbWh1Yl92
OV80LmMKaW5kZXggMGNmN2VmNC4uZWEzMzU5ZiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvbW1odWJfdjlfNC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L21taHViX3Y5XzQuYwpAQCAtMTE4LDE0ICsxMTgsMjUgQEAgc3RhdGljIHZvaWQgbW1odWJfdjlf
NF9pbml0X3N5c3RlbV9hcGVydHVyZV9yZWdzKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAog
CQkJICAgIGFkZXYtPmdtYy5hZ3Bfc3RhcnQgPj4gMjQpOwogCiAJLyogUHJvZ3JhbSB0aGUgc3lz
dGVtIGFwZXJ0dXJlIGxvdyBsb2dpY2FsIHBhZ2UgbnVtYmVyLiAqLwotCVdSRUczMl9TT0MxNV9P
RkZTRVQoTU1IVUIsIDAsCi0JCQkgICAgbW1WTVNIQVJFRFZDMF9NQ19WTV9TWVNURU1fQVBFUlRV
UkVfTE9XX0FERFIsCi0JCQkgICAgaHViaWQgKiBNTUhVQl9JTlNUQU5DRV9SRUdJU1RFUl9PRkZT
RVQsCi0JCQkgICAgbWluKGFkZXYtPmdtYy5mYl9zdGFydCwgYWRldi0+Z21jLmFncF9zdGFydCkg
Pj4gMTgpOwotCVdSRUczMl9TT0MxNV9PRkZTRVQoTU1IVUIsIDAsCi0JCQkgICAgbW1WTVNIQVJF
RFZDMF9NQ19WTV9TWVNURU1fQVBFUlRVUkVfSElHSF9BRERSLAotCQkJICAgIGh1YmlkICogTU1I
VUJfSU5TVEFOQ0VfUkVHSVNURVJfT0ZGU0VULAotCQkJICAgIG1heChhZGV2LT5nbWMuZmJfZW5k
LCBhZGV2LT5nbWMuYWdwX2VuZCkgPj4gMTgpOworCWlmIChhbWRncHVfc3Jpb3ZfdmYoYWRldikp
IHsKKwkJV1JFRzMyX1NPQzE1X09GRlNFVChNTUhVQiwgMCwKKwkJCQkJbW1WTVNIQVJFRFZDMF9N
Q19WTV9TWVNURU1fQVBFUlRVUkVfTE9XX0FERFIsCisJCQkJCWh1YmlkICogTU1IVUJfSU5TVEFO
Q0VfUkVHSVNURVJfT0ZGU0VULAorCQkJCQlhZGV2LT5nbWMuZmJfc3RhcnQgPj4gMTgpOworCQlX
UkVHMzJfU09DMTVfT0ZGU0VUKE1NSFVCLCAwLAorCQkJCQltbVZNU0hBUkVEVkMwX01DX1ZNX1NZ
U1RFTV9BUEVSVFVSRV9ISUdIX0FERFIsCisJCQkJCWh1YmlkICogTU1IVUJfSU5TVEFOQ0VfUkVH
SVNURVJfT0ZGU0VULAorCQkJCQlhZGV2LT5nbWMuZmJfZW5kID4+IDE4KTsKKwl9IGVsc2Ugewor
CQlXUkVHMzJfU09DMTVfT0ZGU0VUKE1NSFVCLCAwLAorCQkJCSAgICBtbVZNU0hBUkVEVkMwX01D
X1ZNX1NZU1RFTV9BUEVSVFVSRV9MT1dfQUREUiwKKwkJCQkgICAgaHViaWQgKiBNTUhVQl9JTlNU
QU5DRV9SRUdJU1RFUl9PRkZTRVQsCisJCQkJICAgIG1pbihhZGV2LT5nbWMuZmJfc3RhcnQsIGFk
ZXYtPmdtYy5hZ3Bfc3RhcnQpID4+IDE4KTsKKwkJV1JFRzMyX1NPQzE1X09GRlNFVChNTUhVQiwg
MCwKKwkJCQkgICAgbW1WTVNIQVJFRFZDMF9NQ19WTV9TWVNURU1fQVBFUlRVUkVfSElHSF9BRERS
LAorCQkJCSAgICBodWJpZCAqIE1NSFVCX0lOU1RBTkNFX1JFR0lTVEVSX09GRlNFVCwKKwkJCQkg
ICAgbWF4KGFkZXYtPmdtYy5mYl9lbmQsIGFkZXYtPmdtYy5hZ3BfZW5kKSA+PiAxOCk7CisJfQog
CiAJLyogU2V0IGRlZmF1bHQgcGFnZSBhZGRyZXNzLiAqLwogCXZhbHVlID0gYWRldi0+dnJhbV9z
Y3JhdGNoLmdwdV9hZGRyIC0gYWRldi0+Z21jLnZyYW1fc3RhcnQgKwotLSAKMi43LjQKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGlu
ZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
