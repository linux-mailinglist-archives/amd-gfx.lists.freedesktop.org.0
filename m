Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A3CA2BAEC
	for <lists+amd-gfx@lfdr.de>; Mon, 27 May 2019 21:52:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C009489AC6;
	Mon, 27 May 2019 19:52:22 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700045.outbound.protection.outlook.com [40.107.70.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F6BA89AC6
 for <amd-gfx@lists.freedesktop.org>; Mon, 27 May 2019 19:52:20 +0000 (UTC)
Received: from DM5PR12CA0003.namprd12.prod.outlook.com (2603:10b6:4:1::13) by
 DM5PR12MB1273.namprd12.prod.outlook.com (2603:10b6:3:76::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1922.20; Mon, 27 May 2019 19:52:19 +0000
Received: from CO1NAM03FT022.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::200) by DM5PR12CA0003.outlook.office365.com
 (2603:10b6:4:1::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1922.16 via Frontend
 Transport; Mon, 27 May 2019 19:52:19 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 CO1NAM03FT022.mail.protection.outlook.com (10.152.80.182) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1922.16 via Frontend Transport; Mon, 27 May 2019 19:52:18 +0000
Received: from leodev.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Mon, 27 May 2019
 14:52:01 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 21/26] drm/amd/display: Refactor DIO stream encoder
Date: Mon, 27 May 2019 15:51:00 -0400
Message-ID: <1558986665-12964-22-git-send-email-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1558986665-12964-1-git-send-email-sunpeng.li@amd.com>
References: <1558986665-12964-1-git-send-email-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(136003)(39860400002)(396003)(346002)(376002)(2980300002)(428003)(199004)(189003)(14444005)(6916009)(16586007)(316002)(2876002)(486006)(51416003)(476003)(2906002)(47776003)(2616005)(70586007)(70206006)(2351001)(446003)(11346002)(126002)(68736007)(76176011)(48376002)(7696005)(50466002)(426003)(36756003)(305945005)(50226002)(336012)(8936002)(186003)(81166006)(26005)(77096007)(8676002)(81156014)(5660300002)(72206003)(86152003)(4326008)(86362001)(356004)(478600001)(53416004)(53936002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1273; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8165bf1c-0a07-4870-9882-08d6e2dcd39e
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:DM5PR12MB1273; 
X-MS-TrafficTypeDiagnostic: DM5PR12MB1273:
X-Microsoft-Antispam-PRVS: <DM5PR12MB12738DA4FF3B3231F38D4257821D0@DM5PR12MB1273.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1775;
X-Forefront-PRVS: 0050CEFE70
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: 4+HCPF5ahoSXDlhbyZiOsL0UoqQEW4eiAa1UBQ9tnZNukDnC/xB1H5Y9o0G0lE/VUqZUExKq/s+E8Wrdlx2ZJYKy1/nZawopTd32TsMRr1T6WeQPYD96Fnz0os+a/A+DBpapsxGTUR6iTgL2pbwexA/EL7hyB0VEFGBfuOK/kjXFt3QTdLnC1WHCOMT5/Vo1u4sI8h3ktl285Z/HGMl4S5bzuSVwGsqoTz6mW3mCFMwJOKCL/6NYgKjQFCyhykMiKK4ikM5xVXz6MxffRc1QajVV4IIUznGV8Gs43hrARO2fVAsL9cBuOxiB8NDMqYnilpz/aXfpo7NZMI4WNHPbXKLOAbK/09ve7XbdTIezS7scdg8Fqo3U5uUB3hOfXlY4PlHGUCCXkPVInX7riOybBkVbRo8yLgQEttypokg2eOQ=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2019 19:52:18.8501 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8165bf1c-0a07-4870-9882-08d6e2dcd39e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1273
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uZfxg3qwsGbfdcOCggUMhJGptcbpGwmHSts+ELVu3/U=;
 b=MZvrjfNneh/aA3pnn9k+InChyhsd5E44WEm0beSENyPcJWVv7X+wqnFMmx4/Lh2j1qT+ouQklhTTnGvw7vY92Lfr5h1rt9IuV+1l4WDLvKLCrsHvBcOcL/jxUZtd3SufbbEXkI292USL5nFzySQRFAoRyEZgGAT02O1M0eSz1CE=
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
Cc: Eric Bernstein <eric.bernstein@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogRXJpYyBCZXJuc3RlaW4gPGVyaWMuYmVybnN0ZWluQGFtZC5jb20+CgoqIFB1bGwgZHVw
bGljYXRlIGF1ZGlvX2Nsb2NrX2luZm8gc3RydWN0IHRvIHN0cmVhbV9lbmNvZGVyLmgKKiBHZW5l
cmFsaXplIHNlY19nc3A3KiB0byBzZWNfZ3NwX3BwcyoKKiBFeHBvc2UgZW5jMSBhbmQgZW5jMiBz
dHJlYW0gZW5jb2RlciBhdWRpbyBmdW5jcwoKU2lnbmVkLW9mZi1ieTogRXJpYyBCZXJuc3RlaW4g
PGVyaWMuYmVybnN0ZWluQGFtZC5jb20+ClJldmlld2VkLWJ5OiBDaGFybGVuZSBMaXUgPENoYXJs
ZW5lLkxpdUBhbWQuY29tPgpSZXZpZXdlZC1ieTogRG15dHJvIExha3R5dXNoa2luIDxEbXl0cm8u
TGFrdHl1c2hraW5AYW1kLmNvbT4KQWNrZWQtYnk6IExlbyBMaSA8c3VucGVuZy5saUBhbWQuY29t
PgotLS0KIC4uLi9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjZS9kY2Vfc3RyZWFtX2VuY29kZXIu
YyB8IDEzIC0tLS0tLS0tLS0tLS0KIC4uLi9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMTAvZGNuMTBf
c3RyZWFtX2VuY29kZXIuYyB8IDIxICsrKystLS0tLS0tLS0tLS0tLS0tLQogLi4uL2RybS9hbWQv
ZGlzcGxheS9kYy9kY24xMC9kY24xMF9zdHJlYW1fZW5jb2Rlci5oIHwgMTcgKysrKysrKysrKysr
KysrKysKIC4uLi9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2luYy9ody9zdHJlYW1fZW5jb2Rlci5o
ICB8IDEzICsrKysrKysrKysrKysKIDQgZmlsZXMgY2hhbmdlZCwgMzQgaW5zZXJ0aW9ucygrKSwg
MzAgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5
L2RjL2RjZS9kY2Vfc3RyZWFtX2VuY29kZXIuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxh
eS9kYy9kY2UvZGNlX3N0cmVhbV9lbmNvZGVyLmMKaW5kZXggNjFmZTI1OS4uMzY5MGNhOSAxMDA2
NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjZS9kY2Vfc3RyZWFtX2Vu
Y29kZXIuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNlL2RjZV9zdHJl
YW1fZW5jb2Rlci5jCkBAIC0xMTI0LDE5ICsxMTI0LDYgQEAgdW5pb24gYXVkaW9fY2VhX2NoYW5u
ZWxzIHsKIAl9IGNoYW5uZWxzOwogfTsKIAotc3RydWN0IGF1ZGlvX2Nsb2NrX2luZm8gewotCS8q
IHBpeGVsIGNsb2NrIGZyZXF1ZW5jeSovCi0JdWludDMyX3QgcGl4ZWxfY2xvY2tfaW5fMTBraHo7
Ci0JLyogTiAtIDMyS0h6IGF1ZGlvICovCi0JdWludDMyX3Qgbl8zMmtoejsKLQkvKiBDVFMgLSAz
MktIeiBhdWRpbyovCi0JdWludDMyX3QgY3RzXzMya2h6OwotCXVpbnQzMl90IG5fNDRraHo7Ci0J
dWludDMyX3QgY3RzXzQ0a2h6OwotCXVpbnQzMl90IG5fNDhraHo7Ci0JdWludDMyX3QgY3RzXzQ4
a2h6OwotfTsKLQogLyogMjUuMk1Iei8xLjAwMSovCiAvKiAyNS4yTUh6LzEuMDAxKi8KIC8qIDI1
LjJNSHoqLwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjEw
L2RjbjEwX3N0cmVhbV9lbmNvZGVyLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMv
ZGNuMTAvZGNuMTBfc3RyZWFtX2VuY29kZXIuYwppbmRleCBiYTcxYjUyLi4yZDE1YWU2IDEwMDY0
NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMTAvZGNuMTBfc3RyZWFt
X2VuY29kZXIuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMTAvZGNu
MTBfc3RyZWFtX2VuY29kZXIuYwpAQCAtNDcyLDcgKzQ3Miw3IEBAIHZvaWQgZW5jMV9zdHJlYW1f
ZW5jb2Rlcl9kcF9zZXRfc3RyZWFtX2F0dHJpYnV0ZSgKIAkJaHdfY3J0Y190aW1pbmcudl9hZGRy
ZXNzYWJsZSArIGh3X2NydGNfdGltaW5nLnZfYm9yZGVyX2JvdHRvbSk7CiB9CiAKLXN0YXRpYyB2
b2lkIGVuYzFfc3RyZWFtX2VuY29kZXJfc2V0X3N0cmVhbV9hdHRyaWJ1dGVfaGVscGVyKAordm9p
ZCBlbmMxX3N0cmVhbV9lbmNvZGVyX3NldF9zdHJlYW1fYXR0cmlidXRlX2hlbHBlcigKIAkJc3Ry
dWN0IGRjbjEwX3N0cmVhbV9lbmNvZGVyICplbmMxLAogCQlzdHJ1Y3QgZGNfY3J0Y190aW1pbmcg
KmNydGNfdGltaW5nKQogewpAQCAtMTA5MSwxOSArMTA5MSw2IEBAIHVuaW9uIGF1ZGlvX2NlYV9j
aGFubmVscyB7CiAJfSBjaGFubmVsczsKIH07CiAKLXN0cnVjdCBhdWRpb19jbG9ja19pbmZvIHsK
LQkvKiBwaXhlbCBjbG9jayBmcmVxdWVuY3kqLwotCXVpbnQzMl90IHBpeGVsX2Nsb2NrX2luXzEw
a2h6OwotCS8qIE4gLSAzMktIeiBhdWRpbyAqLwotCXVpbnQzMl90IG5fMzJraHo7Ci0JLyogQ1RT
IC0gMzJLSHogYXVkaW8qLwotCXVpbnQzMl90IGN0c18zMmtoejsKLQl1aW50MzJfdCBuXzQ0a2h6
OwotCXVpbnQzMl90IGN0c180NGtoejsKLQl1aW50MzJfdCBuXzQ4a2h6OwotCXVpbnQzMl90IGN0
c180OGtoejsKLX07Ci0KIC8qIDI1LjJNSHovMS4wMDEqLwogLyogMjUuMk1Iei8xLjAwMSovCiAv
KiAyNS4yTUh6Ki8KQEAgLTEyMDYsNyArMTE5Myw3IEBAIHN0YXRpYyB1bmlvbiBhdWRpb19jZWFf
Y2hhbm5lbHMgc3BlYWtlcnNfdG9fY2hhbm5lbHMoCiAJcmV0dXJuIGNlYV9jaGFubmVsczsKIH0K
IAotc3RhdGljIHZvaWQgZ2V0X2F1ZGlvX2Nsb2NrX2luZm8oCit2b2lkIGdldF9hdWRpb19jbG9j
a19pbmZvKAogCWVudW0gZGNfY29sb3JfZGVwdGggY29sb3JfZGVwdGgsCiAJdWludDMyX3QgY3J0
Y19waXhlbF9jbG9ja19pbl9raHosCiAJdWludDMyX3QgYWN0dWFsX3BpeGVsX2Nsb2NrX2luX2to
eiwKQEAgLTE0MTAsNyArMTM5Nyw3IEBAIHN0YXRpYyB2b2lkIGVuYzFfc2Vfc2V0dXBfZHBfYXVk
aW8oCiAJUkVHX1VQREFURShBRk1UXzYwOTU4XzAsIEFGTVRfNjA5NThfQ1NfQ0xPQ0tfQUNDVVJB
Q1ksIDApOwogfQogCi1zdGF0aWMgdm9pZCBlbmMxX3NlX2VuYWJsZV9hdWRpb19jbG9jaygKK3Zv
aWQgZW5jMV9zZV9lbmFibGVfYXVkaW9fY2xvY2soCiAJc3RydWN0IHN0cmVhbV9lbmNvZGVyICpl
bmMsCiAJYm9vbCBlbmFibGUpCiB7CkBAIC0xNDMyLDcgKzE0MTksNyBAQCBzdGF0aWMgdm9pZCBl
bmMxX3NlX2VuYWJsZV9hdWRpb19jbG9jaygKIAkgKi8KIH0KIAotc3RhdGljIHZvaWQgZW5jMV9z
ZV9lbmFibGVfZHBfYXVkaW8oCit2b2lkIGVuYzFfc2VfZW5hYmxlX2RwX2F1ZGlvKAogCXN0cnVj
dCBzdHJlYW1fZW5jb2RlciAqZW5jKQogewogCXN0cnVjdCBkY24xMF9zdHJlYW1fZW5jb2RlciAq
ZW5jMSA9IERDTjEwU1RSRU5DX0ZST01fU1RSRU5DKGVuYyk7CmRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMTAvZGNuMTBfc3RyZWFtX2VuY29kZXIuaCBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24xMC9kY24xMF9zdHJlYW1fZW5jb2Rlci5o
CmluZGV4IGEyOTJiMTAuLjQ2YzkzZmYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
ZGlzcGxheS9kYy9kY24xMC9kY24xMF9zdHJlYW1fZW5jb2Rlci5oCisrKyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvZGlzcGxheS9kYy9kY24xMC9kY24xMF9zdHJlYW1fZW5jb2Rlci5oCkBAIC01NTIs
NCArNTUyLDIxIEBAIHZvaWQgZW5jMV9kaWdfY29ubmVjdF90b19vdGcoCiAJc3RydWN0IHN0cmVh
bV9lbmNvZGVyICplbmMsCiAJaW50IHRnX2luc3QpOwogCit2b2lkIGVuYzFfc3RyZWFtX2VuY29k
ZXJfc2V0X3N0cmVhbV9hdHRyaWJ1dGVfaGVscGVyKAorCXN0cnVjdCBkY24xMF9zdHJlYW1fZW5j
b2RlciAqZW5jMSwKKwlzdHJ1Y3QgZGNfY3J0Y190aW1pbmcgKmNydGNfdGltaW5nKTsKKwordm9p
ZCBlbmMxX3NlX2VuYWJsZV9hdWRpb19jbG9jaygKKwlzdHJ1Y3Qgc3RyZWFtX2VuY29kZXIgKmVu
YywKKwlib29sIGVuYWJsZSk7CisKK3ZvaWQgZW5jMV9zZV9lbmFibGVfZHBfYXVkaW8oCisJc3Ry
dWN0IHN0cmVhbV9lbmNvZGVyICplbmMpOworCit2b2lkIGdldF9hdWRpb19jbG9ja19pbmZvKAor
CWVudW0gZGNfY29sb3JfZGVwdGggY29sb3JfZGVwdGgsCisJdWludDMyX3QgY3J0Y19waXhlbF9j
bG9ja19pbl9raHosCisJdWludDMyX3QgYWN0dWFsX3BpeGVsX2Nsb2NrX2luX2toeiwKKwlzdHJ1
Y3QgYXVkaW9fY2xvY2tfaW5mbyAqYXVkaW9fY2xvY2tfaW5mbyk7CisKICNlbmRpZiAvKiBfX0RD
X1NUUkVBTV9FTkNPREVSX0RDTjEwX0hfXyAqLwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9kaXNwbGF5L2RjL2luYy9ody9zdHJlYW1fZW5jb2Rlci5oIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9kaXNwbGF5L2RjL2luYy9ody9zdHJlYW1fZW5jb2Rlci5oCmluZGV4IDUzNzU2MzguLjc0
ZGIxZDggMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9pbmMvaHcv
c3RyZWFtX2VuY29kZXIuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvaW5j
L2h3L3N0cmVhbV9lbmNvZGVyLmgKQEAgLTUyLDYgKzUyLDE5IEBAIGVudW0gZHBfY29tcG9uZW50
X2RlcHRoIHsKIAlEUF9DT01QT05FTlRfUElYRUxfREVQVEhfMTZCUEMJCT0gMHgwMDAwMDAwNAog
fTsKIAorc3RydWN0IGF1ZGlvX2Nsb2NrX2luZm8geworCS8qIHBpeGVsIGNsb2NrIGZyZXF1ZW5j
eSovCisJdWludDMyX3QgcGl4ZWxfY2xvY2tfaW5fMTBraHo7CisJLyogTiAtIDMyS0h6IGF1ZGlv
ICovCisJdWludDMyX3Qgbl8zMmtoejsKKwkvKiBDVFMgLSAzMktIeiBhdWRpbyovCisJdWludDMy
X3QgY3RzXzMya2h6OworCXVpbnQzMl90IG5fNDRraHo7CisJdWludDMyX3QgY3RzXzQ0a2h6Owor
CXVpbnQzMl90IG5fNDhraHo7CisJdWludDMyX3QgY3RzXzQ4a2h6OworfTsKKwogc3RydWN0IGVu
Y29kZXJfaW5mb19mcmFtZSB7CiAJLyogYXV4aWxpYXJ5IHZpZGVvIGluZm9ybWF0aW9uICovCiAJ
c3RydWN0IGRjX2luZm9fcGFja2V0IGF2aTsKLS0gCjIuNy40CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2FtZC1nZng=
