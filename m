Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FD3069DDE
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Jul 2019 23:22:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6400B89D58;
	Mon, 15 Jul 2019 21:22:06 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780078.outbound.protection.outlook.com [40.107.78.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3E5189CC9
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 21:21:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IsK02HClE16dhC/KBE1+vYlUXHQD8bxhZHPe4nXj5ep8NDdqtlS7YMxw/1SJ9s0ielCQPaunzGBMZ/YFg3fcjUOYNgA9Tkc6mIfvmgGtJ6cVZIsTTBhB4o8em5ARyMZxRDnOk8EmuKSsaN3VkHrLbeg/UYc7oMA6tx1BbiDDXUKa13g6GGsa/wKDV3xKa5T28qhh390N/c5ugW8NPvI8PqdhDEGx6LvTZvFSMbKp4qPbIuZh6RmiNoaWCUwqHFyH/zRx+2+i8aqjP1I6F6OPpD0DQkVG9YGczUtulv89pDpqUu5wKJdaHZ88yOF26uBX9YcEbrJSvUGa5cfPCN9cSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nt7rzvJyu5zQNU7RKWWjNdBrikx9m/3W5l2OerKWx0U=;
 b=SndPb6e34vltKOtc7cBmNeoPkI+jaXwqybUXJFXthr/mEan+3JYQm79oC/eZ3KjTr/Ttk/LHqsfvkutHQlhJdG3+IMINIoH4Sow9U/QZmd7lanGMWIPR6tJaJcvFUrt1RxuN105+dDODo4oFZiNNIQKNVJnUUFPIL3HebBotksu4wbagpRf51QAVgDvG4hXHOmeZCKu82ajiJqZT+H1qtxyGMwF7TthIfio1WSH9kwz/obQtciA3NjDYx7CMLjgy1WIIC469ijMwkbb7372swAgNLuntMdiiZL/cgmXjQawaRr0YaDI4D6rTigjeNU/tzkr7YZNtLLOuZYhyZGW4/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from DM3PR12CA0112.namprd12.prod.outlook.com (2603:10b6:0:55::32) by
 BY5PR12MB3921.namprd12.prod.outlook.com (2603:10b6:a03:1a2::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2073.14; Mon, 15 Jul
 2019 21:21:54 +0000
Received: from CO1NAM03FT048.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::200) by DM3PR12CA0112.outlook.office365.com
 (2603:10b6:0:55::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2073.14 via Frontend
 Transport; Mon, 15 Jul 2019 21:21:54 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT048.mail.protection.outlook.com (10.152.81.49) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Mon, 15 Jul 2019 21:21:53 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Mon, 15 Jul 2019 16:21:35 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 64/87] drm/amd/display: Change offset_to_id to reflect what
 id_to_offset returns
Date: Mon, 15 Jul 2019 17:20:26 -0400
Message-ID: <20190715212049.4584-65-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190715212049.4584-1-sunpeng.li@amd.com>
References: <20190715212049.4584-1-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(346002)(39860400002)(396003)(376002)(2980300002)(428003)(199004)(189003)(2906002)(48376002)(5660300002)(6916009)(126002)(53936002)(49486002)(446003)(81166006)(50226002)(50466002)(70206006)(81156014)(4326008)(70586007)(11346002)(476003)(2616005)(2870700001)(426003)(47776003)(26005)(8936002)(8676002)(316002)(6666004)(356004)(186003)(51416003)(2351001)(336012)(86362001)(305945005)(54906003)(1076003)(486006)(2876002)(76176011)(36756003)(478600001)(68736007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BY5PR12MB3921; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7e41bb53-0229-4cb5-a721-08d7096a7589
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:BY5PR12MB3921; 
X-MS-TrafficTypeDiagnostic: BY5PR12MB3921:
X-Microsoft-Antispam-PRVS: <BY5PR12MB39210ED36255D952D5BC59A282CF0@BY5PR12MB3921.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-Forefront-PRVS: 00997889E7
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: KngZpGH0AbYScQTP2m0ZD/oPXh8uP+mtdPXolEuLAd9URSa++p2bR7x+F3yPXuA8PZzDaVTHtCWRH5Wx/j8gCMFFziNos21yaRUnldMD/oC9+UyhwaRtXN1xrHWRkt6RRelshCcTD6gChi/YZCGBBqDXG2yVhEEO4Tp9ilAxKSRxkar3GlTyQ74BsWvNGqnauWp0McthXmlSXmwMNgMkHxotPIB7xIwZKiJ9n0DioGaNsxkgHQIKLjHrzD6o0uG6fb7AJf1nPrzUTweSrOnWKI85vtafZdTurrtVRro0uMXOF3/5vfyiJ9p+g5jYyBI/wwoEULx94QL6pfgp6S3z/UuAbboOpV61J3xG2LuZhJaLcoC6mundQ5nEQuvBv7yxFW0PuozamGHM9VQBgoUU/b44GN+RocLXS/KXNC9PKKQ=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2019 21:21:53.7431 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e41bb53-0229-4cb5-a721-08d7096a7589
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB3921
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nt7rzvJyu5zQNU7RKWWjNdBrikx9m/3W5l2OerKWx0U=;
 b=iVsdftGYpyRiCvdyqtVPQzkHISJFPvP1G/qR3g+bKcRTHdwLv79KdnMzCa5HexP7qvryugrgYVzdb/3xKptMPCeAjbntR+6A0uXaKp5t647C0gwCYLwGxsXPgWpIDO7J0tdPJpm7P8U7NuBHsM7YVJhY2ZOA9gZFI5qLFmtDvXQ=
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
Cc: Leo Li <sunpeng.li@amd.com>, Murton Liu <murton.liu@amd.com>,
 Aric Cyr <Aric.Cyr@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogTXVydG9uIExpdSA8bXVydG9uLmxpdUBhbWQuY29tPgoKaWRfdG9fb2Zmc2V0IGRvZXMg
bm90IHBvaW50IHRvIHRoZSBzYW1lIHJlZyBvZmZzZXQgdGhhdCBvZmZzZXRfdG9faWQgY2hlY2tz
IGZvciwKY2F1c2luZyB1bmludGVuZGVkIGFzc2VydHMKClNpZ25lZC1vZmYtYnk6IE11cnRvbiBM
aXUgPG11cnRvbi5saXVAYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IEFyaWMgQ3lyIDxBcmljLkN5ckBh
bWQuY29tPgpBY2tlZC1ieTogTGVvIExpIDxzdW5wZW5nLmxpQGFtZC5jb20+Ci0tLQogLi4uL2Ry
bS9hbWQvZGlzcGxheS9kYy9ncGlvL2RjbjIwL2h3X3RyYW5zbGF0ZV9kY24yMC5jIHwgIDIgKy0K
IGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9ncGlvL2dwaW9fc2VydmljZS5jICAgICB8
IDEwICsrKy0tLS0tLS0KIDIgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA4IGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9ncGlv
L2RjbjIwL2h3X3RyYW5zbGF0ZV9kY24yMC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5
L2RjL2dwaW8vZGNuMjAvaHdfdHJhbnNsYXRlX2RjbjIwLmMKaW5kZXggYjM5M2NjMTMyOThhLi45
MTVlODk2ZTBlOTEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9n
cGlvL2RjbjIwL2h3X3RyYW5zbGF0ZV9kY24yMC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
ZGlzcGxheS9kYy9ncGlvL2RjbjIwL2h3X3RyYW5zbGF0ZV9kY24yMC5jCkBAIC03MSw3ICs3MSw3
IEBAIHN0YXRpYyBib29sIG9mZnNldF90b19pZCgKIHsKIAlzd2l0Y2ggKG9mZnNldCkgewogCS8q
IEdFTkVSSUMgKi8KLQljYXNlIFJFRyhEQ19HRU5FUklDQSk6CisJY2FzZSBSRUcoRENfR1BJT19H
RU5FUklDX0EpOgogCQkqaWQgPSBHUElPX0lEX0dFTkVSSUM7CiAJCXN3aXRjaCAobWFzaykgewog
CQljYXNlIERDX0dQSU9fR0VORVJJQ19BX19EQ19HUElPX0dFTkVSSUNBX0FfTUFTSzoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9ncGlvL2dwaW9fc2VydmljZS5j
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2dwaW8vZ3Bpb19zZXJ2aWNlLmMKaW5k
ZXggOTM3NDc4YmFjNzk2Li44MGY5MzhlNjgyODUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvZGlzcGxheS9kYy9ncGlvL2dwaW9fc2VydmljZS5jCisrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvZGlzcGxheS9kYy9ncGlvL2dwaW9fc2VydmljZS5jCkBAIC0xNDgsMTQgKzE0OCwxMCBA
QCBzdHJ1Y3QgZ3BpbyAqZGFsX2dwaW9fc2VydmljZV9jcmVhdGVfZ2VuZXJpY19tdXgoCiAJdWlu
dDMyX3QgZW47CiAJc3RydWN0IGdwaW8gKmdlbmVyaWM7CiAKLQlpZiAobWFzayA9PSAxKQotCQll
biA9IEdQSU9fR0VORVJJQ19BOwotCWVsc2UgaWYgKG1hc2sgPT0gMHgwMDAwMDEwMEwpCi0JCWVu
ID0gR1BJT19HRU5FUklDX0I7Ci0JZWxzZQorCWlmICghc2VydmljZS0+dHJhbnNsYXRlLmZ1bmNz
LT5vZmZzZXRfdG9faWQob2Zmc2V0LCBtYXNrLCAmaWQsICZlbikpIHsKKwkJQVNTRVJUX0NSSVRJ
Q0FMKGZhbHNlKTsKIAkJcmV0dXJuIE5VTEw7Ci0KLQlpZCA9IEdQSU9fSURfR0VORVJJQzsKKwl9
CiAKIAlnZW5lcmljID0gZGFsX2dwaW9fY3JlYXRlKAogCQlzZXJ2aWNlLCBpZCwgZW4sIEdQSU9f
UElOX09VVFBVVF9TVEFURV9ERUZBVUxUKTsKLS0gCjIuMjIuMAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdm
eEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9hbWQtZ2Z4
