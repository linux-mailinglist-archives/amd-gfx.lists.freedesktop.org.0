Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BAA637F1B
	for <lists+amd-gfx@lfdr.de>; Thu,  6 Jun 2019 22:55:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92E0D8991E;
	Thu,  6 Jun 2019 20:55:52 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790079.outbound.protection.outlook.com [40.107.79.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E5EA892D4
 for <amd-gfx@lists.freedesktop.org>; Thu,  6 Jun 2019 20:55:49 +0000 (UTC)
Received: from DM3PR12CA0065.namprd12.prod.outlook.com (2603:10b6:0:56::33) by
 DM5PR12MB1276.namprd12.prod.outlook.com (2603:10b6:3:79::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1965.14; Thu, 6 Jun 2019 20:55:47 +0000
Received: from DM3NAM03FT010.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::209) by DM3PR12CA0065.outlook.office365.com
 (2603:10b6:0:56::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1965.12 via Frontend
 Transport; Thu, 6 Jun 2019 20:55:47 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 DM3NAM03FT010.mail.protection.outlook.com (10.152.82.65) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1965.12 via Frontend Transport; Thu, 6 Jun 2019 20:55:47 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Thu, 6 Jun 2019
 15:55:12 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 23/24] drm/amd/display: make clk_mgr call enable_pme_wa
Date: Thu, 6 Jun 2019 16:55:00 -0400
Message-ID: <20190606205501.16505-24-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190606205501.16505-1-Bhawanpreet.Lakha@amd.com>
References: <20190606205501.16505-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(396003)(39860400002)(376002)(346002)(136003)(2980300002)(428003)(189003)(199004)(8936002)(16586007)(76176011)(14444005)(316002)(26005)(50466002)(356004)(6666004)(1076003)(186003)(72206003)(7696005)(2906002)(51416003)(4326008)(478600001)(77096007)(48376002)(6916009)(53416004)(81156014)(5660300002)(81166006)(47776003)(68736007)(11346002)(2616005)(36756003)(446003)(8676002)(50226002)(53936002)(86362001)(126002)(486006)(70206006)(305945005)(336012)(426003)(70586007)(2351001)(476003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1276; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eaf781c7-c43e-4806-f6fb-08d6eac159a7
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328);
 SRVR:DM5PR12MB1276; 
X-MS-TrafficTypeDiagnostic: DM5PR12MB1276:
X-Microsoft-Antispam-PRVS: <DM5PR12MB127600B601DDCF3B670581DAF9170@DM5PR12MB1276.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-Forefront-PRVS: 00603B7EEF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: +q5NCf5NBHc4F9ii4GKFaHjxlmIZ/3GLBbUIhVJFTULDlOu3BZnByKw98lC2jbME5To9MyaGzsiSNiQu4pU00ZeL61Q0K+XVPPdrw9VAQOMHmrbwITk4EI4lwJM5h8RWT7qrIFhS3t84vAwdk1ipXkx9iSihLaJ14KxNf7ddrMYIrtW2syTvN3JXvCu9gfGqFyHi7UVzU2kzkz4MWj3Ff+yxYyr957Xy4UQt66yvp1bkdPxLqVXqtijBCCTZfLE99WUO9tZHl1zlXttB6qm7NkjFrxf7QV+IdqtslzMtqB9Vwj6cfBpHfnz+gOugl0KTsd9Ct+REJEx6NQElGV66jSjE0fPvGh9ufCc+HxghUVxzzxtYWTLo0qOz2UUDj1gm4PUMVs84e8hqSPMmMybUzEcmyWcaX+Mh5BBeBHZlx24=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2019 20:55:47.2190 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eaf781c7-c43e-4806-f6fb-08d6eac159a7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1276
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HPG+1cZ0nHg5RqovdxNzXdGyI7mQWewy8gmyUAGj7wg=;
 b=oC7lygNQHnsnsybX55pxV29+DZGnSNHTHEhgPJceNlRonQIlXnWOPiTCb8U5/wBggfmOZTiuPnaYW/L0K5K085UebjPHyhDZfSfxBvJrCduEh8uJiK6G1ynlTbO8QiCW0YCouLvFglGceeOjprbjz8hZj/H+hMcFY5rSFjd+P5A=
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
Cc: Su Sung Chung <Su.Chung@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogU3UgU3VuZyBDaHVuZyA8U3UuQ2h1bmdAYW1kLmNvbT4KCnJlZmFjdG9yIGEgY29kZSBz
byB3ZSB3aWxsIGNhbGwgY2xrX21ncidzIGVuYWJsZV9wbWVfd2EgZnVuY3Rpb24gc28gd2UKY2Fu
IHVzZSBwbWVfd2EgZm9yIGZ1dHVyZSBhc2ljcy4gVGhpcyB3YXkgd2UgZG9uJ3QgbmVlZCB0byB3
b3JyeSBhYm91dApkaWZmZXJlbnQgQVNJQyBzaW5jZSBjbGtfbWdyIGFscmVhZHkgaGF2ZSB0aGF0
IGluZm9ybWF0aW9uCgpTaWduZWQtb2ZmLWJ5OiBTdSBTdW5nIENodW5nIDxTdS5DaHVuZ0BhbWQu
Y29tPgpSZXZpZXdlZC1ieTogRXJpYyBZYW5nIDxlcmljLnlhbmcyQGFtZC5jb20+CkFja2VkLWJ5
OiBCaGF3YW5wcmVldCBMYWtoYSA8Qmhhd2FucHJlZXQuTGFraGFAYW1kLmNvbT4KLS0tCiAuLi4v
ZGlzcGxheS9kYy9jbGtfbWdyL2RjbjEwL3J2MV9jbGtfbWdyLmMgICAgfCAxNCArKysrKysrKysr
KwogLi4uL2Rpc3BsYXkvZGMvZGNlMTEwL2RjZTExMF9od19zZXF1ZW5jZXIuYyAgIHwgMjUgKysr
KystLS0tLS0tLS0tLS0tLQogMiBmaWxlcyBjaGFuZ2VkLCAyMCBpbnNlcnRpb25zKCspLCAxOSBk
ZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMv
Y2xrX21nci9kY24xMC9ydjFfY2xrX21nci5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5
L2RjL2Nsa19tZ3IvZGNuMTAvcnYxX2Nsa19tZ3IuYwppbmRleCAzMWRiOWI1NWUxMWEuLjE4M2Nh
MzljZTVhMSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2Nsa19t
Z3IvZGNuMTAvcnYxX2Nsa19tZ3IuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkv
ZGMvY2xrX21nci9kY24xMC9ydjFfY2xrX21nci5jCkBAIC0yMTUsOSArMjE1LDIzIEBAIHN0YXRp
YyB2b2lkIHJ2MV91cGRhdGVfY2xvY2tzKHN0cnVjdCBjbGtfbWdyICpjbGtfbWdyX2Jhc2UsCiAJ
fQogfQogCitzdGF0aWMgdm9pZCBydjFfZW5hYmxlX3BtZV93YShzdHJ1Y3QgY2xrX21nciAqY2xr
X21ncl9iYXNlKQoreworCXN0cnVjdCBjbGtfbWdyX2ludGVybmFsICpjbGtfbWdyID0gVE9fQ0xL
X01HUl9JTlRFUk5BTChjbGtfbWdyX2Jhc2UpOworCXN0cnVjdCBwcF9zbXVfZnVuY3NfcnYgKnBw
X3NtdSA9IE5VTEw7CisKKwlpZiAoY2xrX21nci0+cHBfc211KSB7CisJCXBwX3NtdSA9ICZjbGtf
bWdyLT5wcF9zbXUtPnJ2X2Z1bmNzOworCisJCWlmIChwcF9zbXUtPnNldF9wbWVfd2FfZW5hYmxl
KQorCQkJcHBfc211LT5zZXRfcG1lX3dhX2VuYWJsZSgmcHBfc211LT5wcF9zbXUpOworCX0KK30K
Kwogc3RhdGljIHN0cnVjdCBjbGtfbWdyX2Z1bmNzIHJ2MV9jbGtfZnVuY3MgPSB7CiAJLmdldF9k
cF9yZWZfY2xrX2ZyZXF1ZW5jeSA9IGRjZTEyX2dldF9kcF9yZWZfZnJlcV9raHosCiAJLnVwZGF0
ZV9jbG9ja3MgPSBydjFfdXBkYXRlX2Nsb2NrcywKKwkuZW5hYmxlX3BtZV93YSA9IHJ2MV9lbmFi
bGVfcG1lX3dhLAogfTsKIAogc3RhdGljIHN0cnVjdCBjbGtfbWdyX2ludGVybmFsX2Z1bmNzIHJ2
MV9jbGtfaW50ZXJuYWxfZnVuY3MgPSB7CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2Rpc3BsYXkvZGMvZGNlMTEwL2RjZTExMF9od19zZXF1ZW5jZXIuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvZGlzcGxheS9kYy9kY2UxMTAvZGNlMTEwX2h3X3NlcXVlbmNlci5jCmluZGV4IDJhN2Fj
NDUyZDQ1OC4uNWE4MzE0MTBiYzU1IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rp
c3BsYXkvZGMvZGNlMTEwL2RjZTExMF9od19zZXF1ZW5jZXIuYworKysgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2Rpc3BsYXkvZGMvZGNlMTEwL2RjZTExMF9od19zZXF1ZW5jZXIuYwpAQCAtOTM5LDI2
ICs5MzksMTIgQEAgdm9pZCBod3NzX2VkcF9iYWNrbGlnaHRfY29udHJvbCgKIAkJZWRwX3JlY2Vp
dmVyX3JlYWR5X1Q5KGxpbmspOwogfQogCi0vLyBTdGF0aWMgaGVscGVyIGZ1bmN0aW9uIHdoaWNo
IGNhbGxzIHRoZSBjb3JyZWN0IGZ1bmN0aW9uCi0vLyBiYXNlZCBvbiBwcF9zbXUgdmVyc2lvbgot
c3RhdGljIHZvaWQgc2V0X3BtZV93YV9lbmFibGVfYnlfdmVyc2lvbihzdHJ1Y3QgZGMgKmRjKQot
ewotCXN0cnVjdCBwcF9zbXVfZnVuY3MgKnBwX3NtdSA9IE5VTEw7Ci0KLQlpZiAoZGMtPnJlc19w
b29sLT5wcF9zbXUpCi0JCXBwX3NtdSA9IGRjLT5yZXNfcG9vbC0+cHBfc211OwotCi0JaWYgKHBw
X3NtdSkgewotCQlpZiAocHBfc211LT5jdHgudmVyID09IFBQX1NNVV9WRVJfUlYgJiYgcHBfc211
LT5ydl9mdW5jcy5zZXRfcG1lX3dhX2VuYWJsZSkKLQkJCXBwX3NtdS0+cnZfZnVuY3Muc2V0X3Bt
ZV93YV9lbmFibGUoJihwcF9zbXUtPmN0eCkpOwotCX0KLX0KLQogdm9pZCBkY2UxMTBfZW5hYmxl
X2F1ZGlvX3N0cmVhbShzdHJ1Y3QgcGlwZV9jdHggKnBpcGVfY3R4KQogewogCS8qIG5vdGlmeSBh
dWRpbyBkcml2ZXIgZm9yIGF1ZGlvIG1vZGVzIG9mIG1vbml0b3IgKi8KIAlzdHJ1Y3QgZGMgKmNv
cmVfZGMgPSBwaXBlX2N0eC0+c3RyZWFtLT5jdHgtPmRjOwogCXN0cnVjdCBwcF9zbXVfZnVuY3Mg
KnBwX3NtdSA9IE5VTEw7CisJc3RydWN0IGNsa19tZ3IgKmNsa19tZ3IgPSBjb3JlX2RjLT5jbGtf
bWdyOwogCXVuc2lnbmVkIGludCBpLCBudW1fYXVkaW8gPSAxOwogCiAJaWYgKHBpcGVfY3R4LT5z
dHJlYW1fcmVzLmF1ZGlvICYmIHBpcGVfY3R4LT5zdHJlYW1fcmVzLmF1ZGlvLT5lbmFibGVkID09
IHRydWUpCkBAIC05NzYsOSArOTYyLDkgQEAgdm9pZCBkY2UxMTBfZW5hYmxlX2F1ZGlvX3N0cmVh
bShzdHJ1Y3QgcGlwZV9jdHggKnBpcGVfY3R4KQogCiAJCXBpcGVfY3R4LT5zdHJlYW1fcmVzLmF1
ZGlvLT5mdW5jcy0+YXpfZW5hYmxlKHBpcGVfY3R4LT5zdHJlYW1fcmVzLmF1ZGlvKTsKIAotCQlp
ZiAobnVtX2F1ZGlvID49IDEgJiYgcHBfc211ICE9IE5VTEwpCisJCWlmIChudW1fYXVkaW8gPj0g
MSAmJiBjbGtfbWdyLT5mdW5jcy0+ZW5hYmxlX3BtZV93YSkKIAkJCS8qdGhpcyBpcyB0aGUgZmly
c3QgYXVkaW8uIGFwcGx5IHRoZSBQTUUgdy9hIGluIG9yZGVyIHRvIHdha2UgQVogZnJvbSBEMyov
Ci0JCQlzZXRfcG1lX3dhX2VuYWJsZV9ieV92ZXJzaW9uKGNvcmVfZGMpOworCQkJY2xrX21nci0+
ZnVuY3MtPmVuYWJsZV9wbWVfd2EoY2xrX21ncik7CiAJCS8qIHVuLW11dGUgYXVkaW8gKi8KIAkJ
LyogVE9ETzogYXVkaW8gc2hvdWxkIGJlIHBlciBzdHJlYW0gcmF0aGVyIHRoYW4gcGVyIGxpbmsg
Ki8KIAkJcGlwZV9jdHgtPnN0cmVhbV9yZXMuc3RyZWFtX2VuYy0+ZnVuY3MtPmF1ZGlvX211dGVf
Y29udHJvbCgKQEAgLTk5Miw2ICs5NzgsNyBAQCB2b2lkIGRjZTExMF9kaXNhYmxlX2F1ZGlvX3N0
cmVhbShzdHJ1Y3QgcGlwZV9jdHggKnBpcGVfY3R4LCBpbnQgb3B0aW9uKQogewogCXN0cnVjdCBk
YyAqZGMgPSBwaXBlX2N0eC0+c3RyZWFtLT5jdHgtPmRjOwogCXN0cnVjdCBwcF9zbXVfZnVuY3Mg
KnBwX3NtdSA9IE5VTEw7CisJc3RydWN0IGNsa19tZ3IgKmNsa19tZ3IgPSBkYy0+Y2xrX21ncjsK
IAogCWlmIChwaXBlX2N0eC0+c3RyZWFtX3Jlcy5hdWRpbyAmJiBwaXBlX2N0eC0+c3RyZWFtX3Jl
cy5hdWRpby0+ZW5hYmxlZCA9PSBmYWxzZSkKIAkJcmV0dXJuOwpAQCAtMTAyMCw5ICsxMDA3LDkg
QEAgdm9pZCBkY2UxMTBfZGlzYWJsZV9hdWRpb19zdHJlYW0oc3RydWN0IHBpcGVfY3R4ICpwaXBl
X2N0eCwgaW50IG9wdGlvbikKIAkJCXVwZGF0ZV9hdWRpb191c2FnZSgmZGMtPmN1cnJlbnRfc3Rh
dGUtPnJlc19jdHgsIGRjLT5yZXNfcG9vbCwgcGlwZV9jdHgtPnN0cmVhbV9yZXMuYXVkaW8sIGZh
bHNlKTsKIAkJCXBpcGVfY3R4LT5zdHJlYW1fcmVzLmF1ZGlvID0gTlVMTDsKIAkJfQotCQlpZiAo
cHBfc211ICE9IE5VTEwpCisJCWlmIChjbGtfbWdyLT5mdW5jcy0+ZW5hYmxlX3BtZV93YSkKIAkJ
CS8qdGhpcyBpcyB0aGUgZmlyc3QgYXVkaW8uIGFwcGx5IHRoZSBQTUUgdy9hIGluIG9yZGVyIHRv
IHdha2UgQVogZnJvbSBEMyovCi0JCQlzZXRfcG1lX3dhX2VuYWJsZV9ieV92ZXJzaW9uKGRjKTsK
KwkJCWNsa19tZ3ItPmZ1bmNzLT5lbmFibGVfcG1lX3dhKGNsa19tZ3IpOwogCiAJCS8qIFRPRE86
IG5vdGlmeSBhdWRpbyBkcml2ZXIgZm9yIGlmIGF1ZGlvIG1vZGVzIGxpc3QgY2hhbmdlZAogCQkg
KiBhZGQgYXVkaW8gbW9kZSBsaXN0IGNoYW5nZSBmbGFnICovCi0tIAoyLjE3LjEKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBs
aXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
