Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD0BF69DE8
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Jul 2019 23:22:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5B7F89D63;
	Mon, 15 Jul 2019 21:22:10 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710077.outbound.protection.outlook.com [40.107.71.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB0B089D49
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 21:22:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B5IAr3WENic+Cg2t00N6LumxWp3LdLd/iKZhifmHRhR9BNcmPqXzgCUp5dcL8d8OzsAmyQgYp14Hu1aG2HnAiq0Vn2FfbTN1msdzFBzTQDDRe3UPpLTGzlvz6pu0+ud6Sx3H2f/OruFHi/TykiPTsUzpRuOH9rqD3zjy4jWeCk1TPW3ndnkfg7Yv5VxVogaqJtm8Ks8Gs3NAlCTkVGl3pML7Yljz5OXsEuUWxKkcAMPWsO7vn6s1XFX/+YJYvQvJ+N1kYH1eQJuGWKC+v5yQNTOgLGX15HrULfHKQZINixESk8N9Rts9vWUiSKa1DElQthjUTud7LcKh9JFKg3eJyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eY4hJQMXw442FTvNzgDVqlLyqHjTl6i4quW7fZlOZnA=;
 b=NL4KdKTSsLU64pboz50H0447UsLqeRIbASots+/d6gZqDgkChyCWKfqz8bdBOTfWcFArdOV/JFcr2xoFcleD3zdsfxISG2U2lz/6+UvMKPl2tdmvybwR80eAmcVXgIlCQ0TQy+kjbtWM4buH43aBe2cS4wywwg9Yg1fZgTpIuazLsksLOkLVe6aZOqXj0aham2wuSxUXJo0PRD++eG09+8iI81gvGUpCcPHsO/66dD10ULLbZfp9dQUGQHIbpo81G7TfJiroc3xiFS/aRy5S6AqKjUJ9uEG9I1GvuxbLoSSNS+OwxBSLF+gZ7t6F7R7rlVvubvCv+qFNtKykyce9BQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from DM6PR12CA0008.namprd12.prod.outlook.com (2603:10b6:5:1c0::21)
 by MN2PR12MB3933.namprd12.prod.outlook.com (2603:10b6:208:16a::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2073.14; Mon, 15 Jul
 2019 21:22:01 +0000
Received: from CO1NAM03FT063.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::207) by DM6PR12CA0008.outlook.office365.com
 (2603:10b6:5:1c0::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2073.14 via Frontend
 Transport; Mon, 15 Jul 2019 21:22:00 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT063.mail.protection.outlook.com (10.152.81.61) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Mon, 15 Jul 2019 21:22:00 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Mon, 15 Jul 2019 16:21:39 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 75/87] drm/amd/display: Set enabled to false at start of audio
 disable
Date: Mon, 15 Jul 2019 17:20:37 -0400
Message-ID: <20190715212049.4584-76-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190715212049.4584-1-sunpeng.li@amd.com>
References: <20190715212049.4584-1-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(136003)(396003)(346002)(376002)(2980300002)(428003)(189003)(199004)(476003)(8676002)(305945005)(446003)(486006)(126002)(1076003)(54906003)(48376002)(11346002)(47776003)(49486002)(186003)(2616005)(356004)(50466002)(6916009)(86362001)(76176011)(5660300002)(26005)(70206006)(68736007)(426003)(2351001)(70586007)(478600001)(53936002)(50226002)(8936002)(2876002)(51416003)(316002)(81166006)(81156014)(2906002)(36756003)(4326008)(336012)(2870700001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3933; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ff93b583-db52-49fe-373a-08d7096a7972
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:MN2PR12MB3933; 
X-MS-TrafficTypeDiagnostic: MN2PR12MB3933:
X-Microsoft-Antispam-PRVS: <MN2PR12MB3933507508A5CD0C12A6A30382CF0@MN2PR12MB3933.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-Forefront-PRVS: 00997889E7
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: D1udG2tdDIqlsa4ZAcrPIr2IJROyrzrnDaoD9TvrusKBu3P6aPS+07fOacOmxqpQMUn8iBGTuZc0yXTAoaleNfeLbdE3GX0mmxxNLZ0vr5ZyO/sIIoXCwutNAVgiFzCoETdu/BKat8GK0HmuZxXqxT+4s1a6qM/pmHDJYAEZU38G3ilSSl2cQXEUHbNfVE8DHAx2dOr+0odsqn7DHPeeZ7iKrBov/rhplRpCth3hzd7uIX59SjXGpX6bwLW65NUxKyadceRx7WTa8AK2Wi6I3wNrOtHxR3E758Qr2ZAp92Y7R5UYXbB9OUDQnF4K66W445zx6FulZymILY+qD7hVR4vpTupiIvKec788GyJ+RQ8EHz2dkbxPZ08MpM4YCJMjBTIZ8IVvFe7p+Ztor38QSXfwZMN8w7UMr3cl/4Snr4A=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2019 21:22:00.3024 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ff93b583-db52-49fe-373a-08d7096a7972
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3933
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eY4hJQMXw442FTvNzgDVqlLyqHjTl6i4quW7fZlOZnA=;
 b=Ka096rhfc5m0t0df6EjfOSiUUrAOAmSaadlwPEkpViAZtxePMtWpODQxn0XWkLoYJO9GSO4SBpX4baRJzNuZMqH+gHlEpUnXKfP/9IX2wKhv+AqdKRgZ2Cmitvtm4CexsJ7kVozTbCs+/857CjMj1YvqpqkN6gRSTORQW7EPSGY=
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
Cc: Leo Li <sunpeng.li@amd.com>, Zhan Liu <Zhan.Liu@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogTmljaG9sYXMgS2F6bGF1c2thcyA8bmljaG9sYXMua2F6bGF1c2thc0BhbWQuY29tPgoK
W1doeV0KSW4gYW4gZWZmb3J0IHRvIHN0b3AgcmVkdW5kYW50IGNhbGxzIHRvIGRjZTExMF9kaXNh
YmxlX2F1ZGlvX3N0cmVhbQp0aGUgYXVkaW8tPmVuYWJsZWQgZmxhZyB3YXMgYWRkZWQgdG8gdGhl
IGF1ZGlvIHJlc291cmNlIHN0cnVjdC4gV2hpbGUKdGhpcyBzdGF0ZSBwcm9iYWJseSBzaG91bGRu
J3QgaGF2ZSBiZWVuIHRyYWNrZWQgb24gdGhlIGF1ZGlvIHN0cnVjdAppdHNlbGYgaXQgc3RpbGwg
d29ya3MgZmluZSBmb3Igc29tZSBzZXF1ZW5jZXMuCgpIb3dldmVyLCBpdCBkb2VzIG5vdCB3b3Jr
IGZvciBjYXNlcyB3aGVyZSB3ZSdyZSBmcmVlaW5nIHRoZSBhdWRpbwpyZXNvdXJjZSAoc3VjaCBh
cyBob3RwbHVncykgb3Igd2hlbiBkeW5hbWljIGF1ZGlvIGlzIGVuYWJsZWQuCgpJbiB0aGVzZSBj
YXNlcyB0aGUgcGlwZV9jdHgtPnN0cmVhbV9yZXMuYXVkaW8gPSBOVUxMIGJlZm9yZSB3ZSBjYW4K
c2V0IGF1ZGlvLT5lbmFibGVkID0gZmFsc2UuIFRoZSBuZXh0IHRpbWUgd2UgYWNxdWlyZSB0aGUg
YXVkaW8gcmVzb3VyY2UKc3VjaCBhcyBvbiBob3RwbHVnIHRoZSBhdWRpbyB3aWxsIG5vdCBiZSBl
bmFibGVkIGZvciB0aGUgc3RyZWFtIHNpbmNlCkRDIHRoaW5rcyBpdCdzIHN0aWxsIGVuYWJsZWQu
CgpBdWRpbyBzdGF0ZSB0cmFja2luZyBzaG91bGQgY292ZXIgdGhpcyBzZXF1ZW5jZS4KCltIb3dd
ClNldCBhdWRpby0+ZW5hYmxlZCA9IGZhbHNlIGF0IHRoZSBzdGFydCBhcyBsb25nIGFzIHdlIGhh
dmUKcGlwZV9jdHgtPnN0cmVhbV9yZXMuYXVkaW8uCgpTaWduZWQtb2ZmLWJ5OiBOaWNob2xhcyBL
YXpsYXVza2FzIDxuaWNob2xhcy5rYXpsYXVza2FzQGFtZC5jb20+ClJldmlld2VkLWJ5OiBaaGFu
IExpdSA8Wmhhbi5MaXVAYW1kLmNvbT4KQWNrZWQtYnk6IExlbyBMaSA8c3VucGVuZy5saUBhbWQu
Y29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY2UxMTAvZGNlMTEwX2h3
X3NlcXVlbmNlci5jIHwgNCArKy0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAy
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9k
Yy9kY2UxMTAvZGNlMTEwX2h3X3NlcXVlbmNlci5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNw
bGF5L2RjL2RjZTExMC9kY2UxMTBfaHdfc2VxdWVuY2VyLmMKaW5kZXggYjhlZjU3YTI0MjI4Li40
NmRmYWI3NDk2NzkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9k
Y2UxMTAvZGNlMTEwX2h3X3NlcXVlbmNlci5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlz
cGxheS9kYy9kY2UxMTAvZGNlMTEwX2h3X3NlcXVlbmNlci5jCkBAIC05OTYsNiArOTk2LDggQEAg
dm9pZCBkY2UxMTBfZGlzYWJsZV9hdWRpb19zdHJlYW0oc3RydWN0IHBpcGVfY3R4ICpwaXBlX2N0
eCwgaW50IG9wdGlvbikKIAlwaXBlX2N0eC0+c3RyZWFtX3Jlcy5zdHJlYW1fZW5jLT5mdW5jcy0+
YXVkaW9fbXV0ZV9jb250cm9sKAogCQkJcGlwZV9jdHgtPnN0cmVhbV9yZXMuc3RyZWFtX2VuYywg
dHJ1ZSk7CiAJaWYgKHBpcGVfY3R4LT5zdHJlYW1fcmVzLmF1ZGlvKSB7CisJCXBpcGVfY3R4LT5z
dHJlYW1fcmVzLmF1ZGlvLT5lbmFibGVkID0gZmFsc2U7CisKIAkJaWYgKGRjLT5yZXNfcG9vbC0+
cHBfc211KQogCQkJcHBfc211ID0gZGMtPnJlc19wb29sLT5wcF9zbXU7CiAKQEAgLTEwMjYsOCAr
MTAyOCw2IEBAIHZvaWQgZGNlMTEwX2Rpc2FibGVfYXVkaW9fc3RyZWFtKHN0cnVjdCBwaXBlX2N0
eCAqcGlwZV9jdHgsIGludCBvcHRpb24pCiAJCS8qIGRhbF9hdWRpb19kaXNhYmxlX2F6YWxpYV9h
dWRpb19qYWNrX3ByZXNlbmNlKHN0cmVhbS0+YXVkaW8sCiAJCSAqIHN0cmVhbS0+c3RyZWFtX2Vu
Z2luZV9pZCk7CiAJCSAqLwotCQlpZiAocGlwZV9jdHgtPnN0cmVhbV9yZXMuYXVkaW8pCi0JCQlw
aXBlX2N0eC0+c3RyZWFtX3Jlcy5hdWRpby0+ZW5hYmxlZCA9IGZhbHNlOwogCX0KIH0KIAotLSAK
Mi4yMi4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwph
bWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
