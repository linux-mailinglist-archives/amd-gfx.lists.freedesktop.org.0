Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 62FB12BADB
	for <lists+amd-gfx@lfdr.de>; Mon, 27 May 2019 21:52:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D03F5899E7;
	Mon, 27 May 2019 19:52:01 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790087.outbound.protection.outlook.com [40.107.79.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4876A899C7
 for <amd-gfx@lists.freedesktop.org>; Mon, 27 May 2019 19:51:59 +0000 (UTC)
Received: from DM3PR12CA0110.namprd12.prod.outlook.com (2603:10b6:0:55::30) by
 SN6PR12MB2670.namprd12.prod.outlook.com (2603:10b6:805:6f::23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1922.16; Mon, 27 May 2019 19:51:58 +0000
Received: from CO1NAM03FT006.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::203) by DM3PR12CA0110.outlook.office365.com
 (2603:10b6:0:55::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1922.15 via Frontend
 Transport; Mon, 27 May 2019 19:51:57 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 CO1NAM03FT006.mail.protection.outlook.com (10.152.80.75) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1922.16 via Frontend Transport; Mon, 27 May 2019 19:51:57 +0000
Received: from leodev.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Mon, 27 May 2019
 14:51:53 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 06/26] drm/amd/display: Disable audio stream only if it's
 currently enabled
Date: Mon, 27 May 2019 15:50:45 -0400
Message-ID: <1558986665-12964-7-git-send-email-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1558986665-12964-1-git-send-email-sunpeng.li@amd.com>
References: <1558986665-12964-1-git-send-email-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(376002)(39860400002)(396003)(346002)(136003)(2980300002)(428003)(199004)(189003)(36756003)(4326008)(2906002)(6916009)(86152003)(2351001)(426003)(5660300002)(8676002)(50466002)(81166006)(53416004)(48376002)(81156014)(316002)(16586007)(14444005)(2876002)(53936002)(7696005)(51416003)(76176011)(6666004)(356004)(47776003)(68736007)(86362001)(336012)(305945005)(486006)(72206003)(476003)(2616005)(11346002)(446003)(478600001)(126002)(186003)(70586007)(70206006)(77096007)(50226002)(8936002)(26005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:SN6PR12MB2670; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: df8578d9-fc9a-43ea-289e-08d6e2dcc6e2
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:SN6PR12MB2670; 
X-MS-TrafficTypeDiagnostic: SN6PR12MB2670:
X-Microsoft-Antispam-PRVS: <SN6PR12MB2670F86A15200A126D54B748821D0@SN6PR12MB2670.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1079;
X-Forefront-PRVS: 0050CEFE70
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: 1T5bZEdfiVlaG3spRxeoJWMcmCPtLjVuKkGujlnqWkpb83pncMU9CvM6QYyPR0HaI5naA+Gr7ohACYsoXjX6CxlolH98m8H0KoCDi/u2nPk1d/LXCeV+S2bqQS33dvPS5LoGKeEVBimJVx/3wmeW9spJD887kiyPbkInQeA118K8rUOZn17VnKWJxI2zBy+rJBy9k+UrOjo8eMNQv5sYYj62BWTBJCnHNE3X+Q6mvGcYwGxVxWcEavauCeqv9CF07N4axCgJmeIFDYecTd1+xg4+V4Mf4mZnB1l0WTMyTBsxN6VMnprffyDiEFv2kKsEgVA6B/TVUZlCt6jLyKlxvTgt+0j8BdKISC6NCQfwiS6t93aQaa6o65kaI4+auJB0VeSCdqTnampHXJ19403/+LcKxw2XTuvhMcEjRfBY8eY=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2019 19:51:57.4668 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: df8578d9-fc9a-43ea-289e-08d6e2dcc6e2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2670
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CV59MII2FtSRQ4oWTV9Gp3RQMUpZ01EZntPLrV54q0k=;
 b=EtRuFhxE0tE7dBWH0FIhW8Qii3MKimV2kZ61N2VKB3m5zLSPB3Mu8sYfoeqGNJ26cGdk8FOJykv7B5lrmcbT0HS+U2FeqQGjQN7KSvDAqeYT/V/HdRXujNHtYQmudN1rjoNVA/3K/NKxSSuNulwyIyIy0YhnFEmXrP9hqe8Hn1c=
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
Cc: Eryk Brol <eryk.brol@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogRXJ5ayBCcm9sIDxlcnlrLmJyb2xAYW1kLmNvbT4KCltXaHldClByZXZpb3VzbHkgdGhl
cmUgd2VyZSAyIGNvbnNlY3V0aXZlIGNhbGxzIGJlaW5nIG1hZGUgdG8gZGlzYWJsZQphdWRpbyBz
dHJlYW0uIFRoZSBmaXJzdCBvbmUgZGlzYWJsZWQgdGhlIGF1ZGlvIHN0cmVhbSwgYW5kIHRoZSBz
ZWNvbmQKb25lIHdlbnQgdGhyb3VnaCBhbmQgYWxzbyB0cmllZCB0byBkaXNhYmxlIHRoZSBhdWRp
byBzdHJlYW0gY2F1c2luZwpCQUNPIGVudHJ5IGlzc3VlcyBkdWUgdG8gdGhlIEFTSUMgYXBwZWFy
aW5nIGJ1c3kuCgpbSG93XQoxLiBBZGQgYSBzdGF0dXMgZmllbGQgdG8gdGhlIGF1ZGlvIHN0cnVj
dCB3aGljaCBzdG9yZXMgZW5hYmxlZC9kaXNhYmxlZAppbmZvCjIuIEluIHRoZSBjYWxscyB0byBl
bmFibGUvZGlzYWJsZSBhdWRpbyBzdHJlYW0gY2hlY2sgaWYgd2UncmUgYWxyZWFkeQppbiB0aGUg
ZGVzaXJlZCBzdGF0ZSBiZWZvcmUgZXhlY3V0aW5nIHRoZSBmdW5jdGlvbgoKU2lnbmVkLW9mZi1i
eTogRXJ5ayBCcm9sIDxlcnlrLmJyb2xAYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IEp1biBMZWkgPEp1
bi5MZWlAYW1kLmNvbT4KQWNrZWQtYnk6IExlbyBMaSA8c3VucGVuZy5saUBhbWQuY29tPgotLS0K
IGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY2UxMTAvZGNlMTEwX2h3X3NlcXVlbmNl
ci5jIHwgMTAgKysrKysrKysrKwogZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2luYy9o
dy9hdWRpby5oICAgICAgICAgICAgICAgfCAgMSArCiAyIGZpbGVzIGNoYW5nZWQsIDExIGluc2Vy
dGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNl
MTEwL2RjZTExMF9od19zZXF1ZW5jZXIuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9k
Yy9kY2UxMTAvZGNlMTEwX2h3X3NlcXVlbmNlci5jCmluZGV4IGJiMjhiMDUuLmY5ZWU3NzEgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY2UxMTAvZGNlMTEwX2h3
X3NlcXVlbmNlci5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY2UxMTAv
ZGNlMTEwX2h3X3NlcXVlbmNlci5jCkBAIC05NjEsNiArOTYxLDkgQEAgdm9pZCBkY2UxMTBfZW5h
YmxlX2F1ZGlvX3N0cmVhbShzdHJ1Y3QgcGlwZV9jdHggKnBpcGVfY3R4KQogCXN0cnVjdCBwcF9z
bXVfZnVuY3MgKnBwX3NtdSA9IE5VTEw7CiAJdW5zaWduZWQgaW50IGksIG51bV9hdWRpbyA9IDE7
CiAKKwlpZiAocGlwZV9jdHgtPnN0cmVhbV9yZXMuYXVkaW8gJiYgcGlwZV9jdHgtPnN0cmVhbV9y
ZXMuYXVkaW8tPmVuYWJsZWQgPT0gdHJ1ZSkKKwkJcmV0dXJuOworCiAJaWYgKGNvcmVfZGMtPnJl
c19wb29sLT5wcF9zbXUpCiAJCXBwX3NtdSA9IGNvcmVfZGMtPnJlc19wb29sLT5wcF9zbXU7CiAK
QEAgLTk4MCw2ICs5ODMsOCBAQCB2b2lkIGRjZTExMF9lbmFibGVfYXVkaW9fc3RyZWFtKHN0cnVj
dCBwaXBlX2N0eCAqcGlwZV9jdHgpCiAJCS8qIFRPRE86IGF1ZGlvIHNob3VsZCBiZSBwZXIgc3Ry
ZWFtIHJhdGhlciB0aGFuIHBlciBsaW5rICovCiAJCXBpcGVfY3R4LT5zdHJlYW1fcmVzLnN0cmVh
bV9lbmMtPmZ1bmNzLT5hdWRpb19tdXRlX2NvbnRyb2woCiAJCQkJCXBpcGVfY3R4LT5zdHJlYW1f
cmVzLnN0cmVhbV9lbmMsIGZhbHNlKTsKKwkJaWYgKHBpcGVfY3R4LT5zdHJlYW1fcmVzLmF1ZGlv
KQorCQkJcGlwZV9jdHgtPnN0cmVhbV9yZXMuYXVkaW8tPmVuYWJsZWQgPSB0cnVlOwogCX0KIH0K
IApAQCAtOTg4LDYgKzk5Myw5IEBAIHZvaWQgZGNlMTEwX2Rpc2FibGVfYXVkaW9fc3RyZWFtKHN0
cnVjdCBwaXBlX2N0eCAqcGlwZV9jdHgsIGludCBvcHRpb24pCiAJc3RydWN0IGRjICpkYyA9IHBp
cGVfY3R4LT5zdHJlYW0tPmN0eC0+ZGM7CiAJc3RydWN0IHBwX3NtdV9mdW5jcyAqcHBfc211ID0g
TlVMTDsKIAorCWlmIChwaXBlX2N0eC0+c3RyZWFtX3Jlcy5hdWRpbyAmJiBwaXBlX2N0eC0+c3Ry
ZWFtX3Jlcy5hdWRpby0+ZW5hYmxlZCA9PSBmYWxzZSkKKwkJcmV0dXJuOworCiAJcGlwZV9jdHgt
PnN0cmVhbV9yZXMuc3RyZWFtX2VuYy0+ZnVuY3MtPmF1ZGlvX211dGVfY29udHJvbCgKIAkJCXBp
cGVfY3R4LT5zdHJlYW1fcmVzLnN0cmVhbV9lbmMsIHRydWUpOwogCWlmIChwaXBlX2N0eC0+c3Ry
ZWFtX3Jlcy5hdWRpbykgewpAQCAtMTAyMSw2ICsxMDI5LDggQEAgdm9pZCBkY2UxMTBfZGlzYWJs
ZV9hdWRpb19zdHJlYW0oc3RydWN0IHBpcGVfY3R4ICpwaXBlX2N0eCwgaW50IG9wdGlvbikKIAkJ
LyogZGFsX2F1ZGlvX2Rpc2FibGVfYXphbGlhX2F1ZGlvX2phY2tfcHJlc2VuY2Uoc3RyZWFtLT5h
dWRpbywKIAkJICogc3RyZWFtLT5zdHJlYW1fZW5naW5lX2lkKTsKIAkJICovCisJCWlmIChwaXBl
X2N0eC0+c3RyZWFtX3Jlcy5hdWRpbykKKwkJCXBpcGVfY3R4LT5zdHJlYW1fcmVzLmF1ZGlvLT5l
bmFibGVkID0gZmFsc2U7CiAJfQogfQogCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2Rpc3BsYXkvZGMvaW5jL2h3L2F1ZGlvLmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkv
ZGMvaW5jL2h3L2F1ZGlvLmgKaW5kZXggOTI1MjA0Zi4uNmVkMWZiOCAxMDA2NDQKLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2luYy9ody9hdWRpby5oCisrKyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvZGlzcGxheS9kYy9pbmMvaHcvYXVkaW8uaApAQCAtNTcsNiArNTcsNyBAQCBz
dHJ1Y3QgYXVkaW8gewogCWNvbnN0IHN0cnVjdCBhdWRpb19mdW5jcyAqZnVuY3M7CiAJc3RydWN0
IGRjX2NvbnRleHQgKmN0eDsKIAl1bnNpZ25lZCBpbnQgaW5zdDsKKwlib29sIGVuYWJsZWQ7CiB9
OwogCiAjZW5kaWYgIC8qIF9fREFMX0FVRElPX18gKi8KLS0gCjIuNy40CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAph
bWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
