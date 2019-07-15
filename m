Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0464169DDB
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Jul 2019 23:22:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEA9B89D46;
	Mon, 15 Jul 2019 21:22:05 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710068.outbound.protection.outlook.com [40.107.71.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8ED3B89D00
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 21:21:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dhmKCrr3iCs7pOS5JRhO1aUA49Pxn4N1EGFwNZH7fs94AjQ9/703VCf8oybBubw51cxd2HlcvlaYCXcMPxMrZ/Q1Db9fev4wL/J6Z1iTPTXbHSulUlkE7xJBKAWePFB5IhWdFXlnIYdLj9tyRRtLDK4uOma/PCYSoFDIZiUj4zGI6Q5mEuJu/bBo1tMzwWiYuqIWWqQS5+ActtgypOcpXsNGjtCTfA3xbK1nBwjLcu0NWy7gFS8HMVqnYGMgy8M+tdPo4+I3cALYYmIQpi+Y5SmBZZw6mld8UQvUK5QycafaaiSuC88Nh5gfnAxHpQ9RR2pzzqgfa+OhlFk8yawx/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EQaBxx1idEqGpp+9qGddoFiELEyvsx124MxnCnfPX5M=;
 b=M89jozWtKlfsV0uMzKC7/AC5KNjqY2xRroohjmquEgZJNMUmTaJfbhC3WVsAcFrhBBL1elfM9jFHjqCs1ehOwF8muCVQ3jjCprv+fkb9HZ8XppiadmQcFIf5oSIWdWXIUOD/CGAvvJhaxZcaATDlnTToi8C1K8W6MOzOS1dUSUK0EuuhkWq1toWRHCd2LGqC843MIAU0m4FsjhpaOy6YV+/l4LbHveB/o6/VceeI7799MXWZKjI9trZCBPDGydez+AP6ZIVA0kOL5VJVMa/wyAF0dtwH/QkPPuZ34sfnBEpJtH3W9LTNagTLJ5nTlbnVDiX1LtJLnb7X2etNc7PfyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from DM6PR12CA0008.namprd12.prod.outlook.com (2603:10b6:5:1c0::21)
 by MN2PR12MB3933.namprd12.prod.outlook.com (2603:10b6:208:16a::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2073.14; Mon, 15 Jul
 2019 21:21:58 +0000
Received: from CO1NAM03FT063.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::201) by DM6PR12CA0008.outlook.office365.com
 (2603:10b6:5:1c0::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2073.14 via Frontend
 Transport; Mon, 15 Jul 2019 21:21:58 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT063.mail.protection.outlook.com (10.152.81.61) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Mon, 15 Jul 2019 21:21:57 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Mon, 15 Jul 2019 16:21:37 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 71/87] drm/amd/display: populate last calculated bb state with
 max clocks
Date: Mon, 15 Jul 2019 17:20:33 -0400
Message-ID: <20190715212049.4584-72-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190715212049.4584-1-sunpeng.li@amd.com>
References: <20190715212049.4584-1-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(136003)(396003)(346002)(376002)(2980300002)(428003)(189003)(199004)(476003)(8676002)(305945005)(446003)(486006)(126002)(1076003)(54906003)(48376002)(11346002)(47776003)(49486002)(186003)(2616005)(6666004)(356004)(50466002)(6916009)(86362001)(14444005)(76176011)(5660300002)(26005)(70206006)(68736007)(426003)(2351001)(70586007)(478600001)(53936002)(50226002)(8936002)(2876002)(51416003)(316002)(81166006)(81156014)(2906002)(36756003)(4326008)(336012)(2870700001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3933; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c9ef87af-9649-4d0e-e6fc-08d7096a77f2
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:MN2PR12MB3933; 
X-MS-TrafficTypeDiagnostic: MN2PR12MB3933:
X-Microsoft-Antispam-PRVS: <MN2PR12MB3933F39DE92DBEF0C7EC937882CF0@MN2PR12MB3933.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2887;
X-Forefront-PRVS: 00997889E7
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: t6NWLifEY2RI3A+kY6cib32i6KrP1JaMF75kYKTIx2+s48B6G/MTKfw1H6TzpBov/FMdYfFFQQc5SCj5dsyFuocZEni3WbHJwHoMmLB4jIJQB6ogSrUyuZWXvjmJWwuKBXuvaHMJx2hTfRD8lIi0DMab/HMMmAx9ODxi4nn3P6f/EdyWM7kP4eOxd5HXhCGH4FQbrutiCGD6klB6OpCKWUL9yhutpiflqX51M5vXCJ1ILw6WDOE6/Q67wnM7GE8nO1+Nns2TyqNRZPf4kldGJaTga5Hgu14fRSfOOIqOwM2nexorLEjQz9KJJHhJ0vYcJUoteXp/ScABC6fFWX4XkPxr7gHWGQ3KrEvBuxcExYEbIbN9BXeZjWUu299ZBEU5MQwvnbUxdDF6Q/Y9MxKzV5gSqWq3eZRJNK73m2r9ZSY=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2019 21:21:57.8013 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c9ef87af-9649-4d0e-e6fc-08d7096a77f2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3933
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EQaBxx1idEqGpp+9qGddoFiELEyvsx124MxnCnfPX5M=;
 b=erBeYuDHXbp4/IGbG98uNZZVz4YfukAyxjaJDrToDKOnbFXLYZ8zpiaawbkl0SSy0rgvo+QL5pnsbJUQ5Adm05nxBzQXxawDpTCtTvWs7kLhgwyGf2bhsV66kzzfqBiENOe57GxnIxnoE42zOYiZmi0W6sMHJVQqRwzjUq96zPg=
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
Cc: Leo Li <sunpeng.li@amd.com>, Aric Cyr <Aric.Cyr@amd.com>,
 Jun Lei <Jun.Lei@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSnVuIExlaSA8SnVuLkxlaUBhbWQuY29tPgoKW3doeV0KdXBkYXRlX2JvdW5kaW5nX2Jv
eCBjYWxjdWxhdGVzIGludGVybWVkaWF0ZSBiYiBzdGF0ZXMgYmFzZWQgb24gY2xvY2sgcmVsYXRp
b25zaGlwCmhvd2V2ZXIsIHRoZSBsYXN0IHN0YXRlIGRvZXNuJ3QgbmVlZCB0byBtYWludGFpbiBh
IG1pbmltdW0gcmVsYXRpb25zaGlwLCBidXQgc2hvdWxkCmFjdHVhbGx5IGNvbnRhaW4gbWF4aW11
bSBvZiBldmVyeSBjbG9jay4gIG90aGVyd2lzZSBtYXhpbXVtIGNsb2NrcyBhcmUgbm90IHVzYWJs
ZQoKW2hvd10Kb25jZSB0aGUgY2FsY3VsYXRlZCBiYiBpcyBidWlsdCwgb3ZlcnJpZGUgdGhlIGxh
c3Qgc3RhdGUgd2l0aCBtYXggdmFsdWVzCgpTaWduZWQtb2ZmLWJ5OiBKdW4gTGVpIDxKdW4uTGVp
QGFtZC5jb20+ClJldmlld2VkLWJ5OiBBcmljIEN5ciA8QXJpYy5DeXJAYW1kLmNvbT4KQWNrZWQt
Ynk6IExlbyBMaSA8c3VucGVuZy5saUBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQv
ZGlzcGxheS9kYy9kY24yMC9kY24yMF9yZXNvdXJjZS5jIHwgNCArKysrCiAxIGZpbGUgY2hhbmdl
ZCwgNCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNw
bGF5L2RjL2RjbjIwL2RjbjIwX3Jlc291cmNlLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3Bs
YXkvZGMvZGNuMjAvZGNuMjBfcmVzb3VyY2UuYwppbmRleCAyOTZiYzdlNGM0YTIuLjE5MzI3MGJh
NjBlNiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2Rj
bjIwX3Jlc291cmNlLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIw
L2RjbjIwX3Jlc291cmNlLmMKQEAgLTI3NDYsNiArMjc0NiwxMCBAQCBzdGF0aWMgdm9pZCB1cGRh
dGVfYm91bmRpbmdfYm94KHN0cnVjdCBkYyAqZGMsIHN0cnVjdCBfdmNzX2RwaV9zb2NfYm91bmRp
bmdfYm94XwogCQludW1fY2FsY3VsYXRlZF9zdGF0ZXMrKzsKIAl9CiAKKwljYWxjdWxhdGVkX3N0
YXRlc1tudW1fY2FsY3VsYXRlZF9zdGF0ZXMgLSAxXS5zb2NjbGtfbWh6ID0gbWF4X2Nsb2Nrcy0+
c29jQ2xvY2tJbktoeiAvIDEwMDA7CisJY2FsY3VsYXRlZF9zdGF0ZXNbbnVtX2NhbGN1bGF0ZWRf
c3RhdGVzIC0gMV0uZmFicmljY2xrX21oeiA9IG1heF9jbG9ja3MtPnNvY0Nsb2NrSW5LaHogLyAx
MDAwOworCWNhbGN1bGF0ZWRfc3RhdGVzW251bV9jYWxjdWxhdGVkX3N0YXRlcyAtIDFdLmRjZmNs
a19taHogPSBtYXhfY2xvY2tzLT5kY2ZDbG9ja0luS2h6IC8gMTAwMDsKKwogCW1lbWNweShiYi0+
Y2xvY2tfbGltaXRzLCBjYWxjdWxhdGVkX3N0YXRlcywgc2l6ZW9mKGJiLT5jbG9ja19saW1pdHMp
KTsKIAliYi0+bnVtX3N0YXRlcyA9IG51bV9jYWxjdWxhdGVkX3N0YXRlczsKIAotLSAKMi4yMi4w
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4
IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
