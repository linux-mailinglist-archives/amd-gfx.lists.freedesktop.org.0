Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A63CD1A76
	for <lists+amd-gfx@lfdr.de>; Wed,  9 Oct 2019 23:06:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5913E6E896;
	Wed,  9 Oct 2019 21:06:24 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790072.outbound.protection.outlook.com [40.107.79.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 391946E896
 for <amd-gfx@lists.freedesktop.org>; Wed,  9 Oct 2019 21:06:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gsEH04Q1g2KY9HfnuN+YY4SQ3O8qopptr3kVUVwKc9ZPO88xryZRLeIjq1C6SXbDJumZ81yj8P+yUwbzPpkBHW8f8NaxnGDmoo0TJeqCGJ2qb7bujfLUqcGiNA9Gzp1faQdoEEZ1GPNTKSDHigao6rcTLgRfHcMYCA+dAl47DOFoBeUESr9nwmixdMOOxARttgCLw2WE3y1aShhQXNJeSLsA66zklkhZyR9rMIRtYsfj+8yvaoUvPOEZ8BYUNp3clcYayb8fk6zkHSEFK6SBRcG0S5yIdYYmKqHalpmXqXMnYSEL9dx6+l2bt0aH49HQYiBXE4SdO5xBiviKU18lbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tp/sg054YYjzDMGfrIW3DdgJFs+3awdNRGHQXhue9hc=;
 b=l35SLX1Uh8/VG3KNAFtcgXnTUPia2zg7WwILJotEyfWC8/Scngx+3DJKRoTHAzB1rGxaExb1xdv6eRLopfTg8oAVgQOO+IeH5BYr88SNiu1wximLgGZyyurlQs/foeoBt+9nfu/SJ7TFaJaBAuNWS/3ZEqlzqLqNqYqXzfKDEGNOped44zV/DEcpzv9/t/j0KmmHBcDxVh6jH4b/PdOdik7vnp0smk4tu8HqmC5YqjCz43Jo/AESyKokKVp0rkju04X+ApMS2UqeaJ0xxwZHKRWLWylPEguO39pgGMCjQqAMv128JOaeaEg+bO5nC0V2lI3qzy05XObEpGtazTH4VA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from MWHPR1201CA0002.namprd12.prod.outlook.com
 (2603:10b6:301:4a::12) by MN2PR12MB2911.namprd12.prod.outlook.com
 (2603:10b6:208:a9::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.16; Wed, 9 Oct
 2019 21:06:19 +0000
Received: from DM3NAM03FT052.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::207) by MWHPR1201CA0002.outlook.office365.com
 (2603:10b6:301:4a::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2347.16 via Frontend
 Transport; Wed, 9 Oct 2019 21:06:19 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 DM3NAM03FT052.mail.protection.outlook.com (10.152.83.107) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2327.20 via Frontend Transport; Wed, 9 Oct 2019 21:06:19 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Wed, 9 Oct 2019
 16:06:18 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 00/26] Renoir DC Patches
Date: Wed, 9 Oct 2019 17:05:47 -0400
Message-ID: <20191009210613.17929-1-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(136003)(346002)(39860400002)(396003)(428003)(53754006)(189003)(199004)(50466002)(81166006)(8676002)(305945005)(50226002)(8936002)(51416003)(70586007)(4326008)(70206006)(47776003)(6916009)(86362001)(7696005)(14444005)(81156014)(26005)(48376002)(356004)(2906002)(2351001)(6666004)(426003)(336012)(316002)(486006)(16586007)(54906003)(476003)(2616005)(126002)(478600001)(53416004)(186003)(1076003)(36756003)(5660300002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB2911; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 868542d3-8bd5-49a3-5438-08d74cfc87f7
X-MS-TrafficTypeDiagnostic: MN2PR12MB2911:
X-Microsoft-Antispam-PRVS: <MN2PR12MB291198ADEA7D87C85E25A65AF9950@MN2PR12MB2911.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-Forefront-PRVS: 018577E36E
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 51eIoUE58n8onYxzyQ/q5DsFwp2PruUpttIq5YpXPLKr9gsPuUf2gZ0ZmRC4yOVzTCvjvc2GSyLZAHl28q1fKTDj+5Q9NvYKq5yad6WZcoGn2ykZHMKcjt25uQXPTWTw0lvz3tsKqw0mNI31rn5YggXL4BTwM229brmo3picOdm8W0TyQof2kEDWHd2qJAfhqm/suEGcQZQ9iyJCegjHdcEvZrM/CEoKi5UC29E0rvMMtWs7UdcR14D7XWaJUuSAWmTucbHRTy+OBTEmVd/WWZXhE76DuqhaFIbDeS87cNVSd4PUFsfdcP5VUFf4p9GblJDbU3ywA+y6q1cm39P34Y4Uexow0l69021JTO8JpJb9ZcX0ApxZprHIaLIm0w3kc/v2x6QGYpkZK/vTWDPHfvdcR1JdhjOJYvAaWXVfoiM=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2019 21:06:19.1766 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 868542d3-8bd5-49a3-5438-08d74cfc87f7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB2911
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tp/sg054YYjzDMGfrIW3DdgJFs+3awdNRGHQXhue9hc=;
 b=g9H3wGNfhk8fWFtXsZlUWs75RKrbdu1rLwjK9Upqh+RYcsmloDCciijNlGT0BH3vgD12ffE5y1kguJxDoDPaQNOYMbxlnQ38bSGSmJ6MYCsSe5p8Np1Fs4ZQgeQp3N4lmsdktOOXQGFGnRpJP+aYa+iZg3A4yPtwLZWgQWqLZEk=
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
Cc: sunpeng.li@amd.com, Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 harry.wentland@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SGkgYWxsLAoKVGhlcmUgd2FzIGEgZGVsdGEgYmV0d3dlbiBpbnRlcm5hbCBkY24yMSBjb2RlIGFu
ZCB1cHN0cmVhbSBkY24yMSBjb2RlLgpUaGVzZSBjaGFuZ2VzIGJyaW5nIHRoZW0gaW5saW5lLgoK
ClN1bW1hcnkgb2YgQ2hhbmdlcwoqQWRkIFJOIHJlZ2lzdG9ycwoqQWRkIGRjbjEyIGh3c2VxIGFu
ZCBsaW5rX2VuY29kZXIKKlJOIHNwZWNpZmljIGZpeGVzCiphdXggdGltZW91dCBzdXBwb3J0Cipi
b3VuZGluZyBib3ggY2hhbmdlcwoKQmhhd2FucHJlZXQgTGFraGEgKDEyKToKICBkcm0vYW1kL2Rp
c3BsYXk6IEFkZCBEUF9EUEhZX0lOVEVSTkFMX0NUUiByZWdzCiAgZHJtL2FtZC9kaXNwbGF5OiBB
ZGQgRENOX0JBU0UgcmVncwogIGRybS9hbWQvZGlzcGxheTogQWRkIHJlbm9pciBod19zZXEKICBk
cm0vYW1kL2Rpc3BsYXk6IGNyZWF0ZSBkY24yMV9saW5rX2VuY29kZXIgZmlsZXMKICBkcm0vYW1k
L2Rpc3BsYXk6IGFkZCBSRUZDWUNfUEVSX1RSSVBfVE9fTUVNT1JZIHByb2dyYW1taW5nCiAgZHJt
L2FtZC9kaXNwbGF5OiBmaXggaW5jb3JyZWN0IHBhZ2UgdGFibGUgYWRkcmVzcyBmb3IgcmVub2ly
CiAgZHJtL2FtZC9kaXNwbGF5OiBhZGQgZGV0aWxlIGJ1ZmZlciBzaXplIGZvciByZW5vaXIKICBk
cm0vYW1kL2Rpc3BsYXk6IHVwZGF0ZSBkY24yMSBodWJidWIgcmVnaXN0ZXJzCiAgZHJtL2FtZC9k
aXNwbGF5OiB1cGRhdGUgcmVub2lyIGJvdW5kaW5nIGJveCBhbmQgcmVzX2NhcHMKICBkcm0vYW1k
L2Rpc3BsYXk6IGNoYW5nZSBQUF9TTSBkZWZzIHRvIDgKICBkcm0vYW1kL2Rpc3BsYXk6IGhhbmRs
ZSAiMTgiIGNhc2UgaW4gVHJ1bmNUb1ZhbGlkQlBQCiAgZHJtL2FtZC9kaXNwbGF5OiB1c2UgcmVx
dWVzdGVkX2Rpc3BjbGtfa2h6IGluc3RlYWQgb2YgY2xrCgpEbXl0cm8gTGFrdHl1c2hraW4gKDQp
OgogIGRybS9hbWQvZGlzcGxheTogZW5hYmxlIGhvc3R2bSBiYXNlZCBvbiByb2ltbXUgYWN0aXZl
IGZvciBkY24yLjEKICBkcm0vYW1kL2Rpc3BsYXk6IGluaXRpYWxpemUgUk4gZ3B1dm0gY29udGV4
dCBwcm9ncmFtbWluZyBmdW5jdGlvbgogIGRybS9hbWQvZGlzcGxheTogY29ycmVjdCBkY24yMSBO
VU1fVk1JRCB0byAxNgogIGRybS9hbWQvZGlzcGxheTogdXBkYXRlIG9kbSBtb2RlIHZhbGlkYXRp
b24gdG8gYmUgaW4gbGluZSB3aXRoIHBvbGljeQoKRXJpYyBZYW5nICgyKToKICBkcm0vYW1kL2Rp
c3BsYXk6IHVzZSBkY24xMCB2ZXJzaW9uIG9mIHByb2dyYW0gdGlsaW5nIG9uIFJlbm9pcgogIGRy
bS9hbWQvZGlzcGxheTogYWRkIHNhbml0eSBjaGVjayBmb3IgY2xrIHRhYmxlIGZyb20gc211CgpM
ZXdpcyBIdWFuZyAoMyk6CiAgZHJtL2FtZC9kaXNwbGF5OiBtb3ZlIHRoZSBib3VuZGluZyBib3gg
cGF0Y2ggYmVmb3JlIGNhbGN1bGF0ZSB3bQogIGRybS9hbWQvZGlzcGxheTogVGVtcG9yYXJ5IHdv
cmthcm91bmQgdG8gdG9nZ2xlIHdhdGVybWFyayBzZXR0aW5nCiAgZHJtL2FtZC9kaXNwbGF5OiBl
bmFibGUgc211IHNldCBkY2ZjbGsKCk1pY2hhZWwgU3RyYXVzcyAoMSk6CiAgZHJtL2FtZC9kaXNw
bGF5OiBGaXggcm4gYXVkaW8gcGxheWJhY2sgYW5kIHZpZGVvIHBsYXliYWNrIHNwZWVkCgpTdW5n
IExlZSAoMSk6CiAgZHJtL2FtZC9kaXNwbGF5OiBhZGQgZHVtbXkgZnVuY3Rpb25zIHRvIHNtdSBm
b3IgUmVub2lyIFNpbGljb24gRGlhZ3MKCmFiZG91bGF5ZSBiZXJ0aGUgKDIpOgogIGRybS9hbWQv
ZGlzcGxheTogdXBkYXRlIHJlZ2lzdGVyIGZpZWxkIGFjY2VzcyBtZWNoYW5pc20KICBkcm0vYW1k
L2Rpc3BsYXk6IGNvbmZpZ3VyYWJsZSBhdXggdGltZW91dCBzdXBwb3J0Cgpqb3NlcGggZ3JhdmVu
b3IgKDEpOgogIGRybS9hbWQvZGlzcGxheTogZml4IGhlYWRlciBmb3IgUk4gY2xrIG1ncgoKIC4u
Li9hbWQvZGlzcGxheS9kYy9jbGtfbWdyL2RjbjIxL3JuX2Nsa19tZ3IuYyB8ICAyMyArLQogLi4u
L2RjL2Nsa19tZ3IvZGNuMjEvcm5fY2xrX21ncl92Ymlvc19zbXUuYyAgIHwgIDE5ICstCiAuLi4v
Z3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjX2xpbmtfZGRjLmMgfCAgMTQgKwogZHJpdmVy
cy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjLmggICAgICAgICAgIHwgICAyICsKIGRyaXZlcnMv
Z3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY2UvZGNlX2F1eC5jICB8ICA4MiArKystCiBkcml2ZXJz
L2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNlL2RjZV9hdXguaCAgfCAxODcgKysrKysrKystCiAu
Li4vZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY2UvZGNlX2h3c2VxLmggICAgfCAgIDEgKwogLi4u
L2FtZC9kaXNwbGF5L2RjL2RjZTEwMC9kY2UxMDBfcmVzb3VyY2UuYyAgIHwgIDE1ICstCiAuLi4v
YW1kL2Rpc3BsYXkvZGMvZGNlMTEwL2RjZTExMF9yZXNvdXJjZS5jICAgfCAgMTQgKy0KIC4uLi9h
bWQvZGlzcGxheS9kYy9kY2UxMTIvZGNlMTEyX3Jlc291cmNlLmMgICB8ICAxNSArLQogLi4uL2Ft
ZC9kaXNwbGF5L2RjL2RjZTEyMC9kY2UxMjBfcmVzb3VyY2UuYyAgIHwgIDE1ICstCiAuLi4vZHJt
L2FtZC9kaXNwbGF5L2RjL2RjZTgwL2RjZTgwX3Jlc291cmNlLmMgfCAgMTQgKy0KIC4uLi9hbWQv
ZGlzcGxheS9kYy9kY24xMC9kY24xMF9od19zZXF1ZW5jZXIuYyB8ICAgNCArCiAuLi4vYW1kL2Rp
c3BsYXkvZGMvZGNuMTAvZGNuMTBfbGlua19lbmNvZGVyLmggfCAgMzUgKy0KIC4uLi9kcm0vYW1k
L2Rpc3BsYXkvZGMvZGNuMTAvZGNuMTBfcmVzb3VyY2UuYyB8ICAxNSArLQogLi4uL2RybS9hbWQv
ZGlzcGxheS9kYy9kY24yMC9kY24yMF9od3NlcS5jICAgIHwgICA0ICsKIC4uLi9hbWQvZGlzcGxh
eS9kYy9kY24yMC9kY24yMF9saW5rX2VuY29kZXIuaCB8ICAgNyArCiAuLi4vZHJtL2FtZC9kaXNw
bGF5L2RjL2RjbjIwL2RjbjIwX3Jlc291cmNlLmMgfCAgMzEgKy0KIGRyaXZlcnMvZ3B1L2RybS9h
bWQvZGlzcGxheS9kYy9kY24yMS9NYWtlZmlsZSB8ICAgMiArLQogLi4uL2RybS9hbWQvZGlzcGxh
eS9kYy9kY24yMS9kY24yMV9odWJidWIuYyAgIHwgMTE2ICsrKystLQogLi4uL2RybS9hbWQvZGlz
cGxheS9kYy9kY24yMS9kY24yMV9odWJidWIuaCAgIHwgIDM0ICstCiAuLi4vZ3B1L2RybS9hbWQv
ZGlzcGxheS9kYy9kY24yMS9kY24yMV9odWJwLmMgfCAgIDQgKy0KIC4uLi9kcm0vYW1kL2Rpc3Bs
YXkvZGMvZGNuMjEvZGNuMjFfaHdzZXEuYyAgICB8IDEyMiArKysrKysKIC4uLi9kcm0vYW1kL2Rp
c3BsYXkvZGMvZGNuMjEvZGNuMjFfaHdzZXEuaCAgICB8ICAzMyArKwogLi4uL2FtZC9kaXNwbGF5
L2RjL2RjbjIxL2RjbjIxX2xpbmtfZW5jb2Rlci5jIHwgMzg0ICsrKysrKysrKysrKysrKysrKwog
Li4uL2FtZC9kaXNwbGF5L2RjL2RjbjIxL2RjbjIxX2xpbmtfZW5jb2Rlci5oIHwgIDUxICsrKwog
Li4uL2RybS9hbWQvZGlzcGxheS9kYy9kY24yMS9kY24yMV9yZXNvdXJjZS5jIHwgMjY5ICsrKysr
KysrKystLQogZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RtX3BwX3NtdS5oICAgIHwg
ICA2ICstCiAuLi4vZGMvZG1sL2RjbjIxL2Rpc3BsYXlfbW9kZV92YmFfMjEuYyAgICAgICAgfCAg
MTEgKy0KIC4uLi9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2luYy9kY19saW5rX2RkYy5oICB8ICAg
MyArCiAuLi4vZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9pbmMvZGNfbGlua19kcC5oICAgfCAgIDIg
KwogLi4uL2RybS9hbWQvZGlzcGxheS9kYy9pbmMvaHcvYXV4X2VuZ2luZS5oICAgIHwgICAzICsK
IC4uLi9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2luYy9ody9kY2h1YmJ1Yi5oICB8ICAgMSArCiAu
Li4vZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9pbmMvaHcvbWVtX2lucHV0LmggfCAgIDEgKwogLi4u
L2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvaW5jL2h3X3NlcXVlbmNlci5oIHwgICAzICsKIC4uLi9p
bmNsdWRlL2FzaWNfcmVnL2Rjbi9kY25fMl8xXzBfb2Zmc2V0LmggICB8ICAxMCArCiAuLi4vZ3B1
L2RybS9hbWQvaW5jbHVkZS9yZW5vaXJfaXBfb2Zmc2V0LmggICAgfCAgMzQgKysKIDM3IGZpbGVz
IGNoYW5nZWQsIDE0NjEgaW5zZXJ0aW9ucygrKSwgMTI1IGRlbGV0aW9ucygtKQogY3JlYXRlIG1v
ZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMS9kY24yMV9od3Nl
cS5jCiBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2Rj
bjIxL2RjbjIxX2h3c2VxLmgKIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0vYW1k
L2Rpc3BsYXkvZGMvZGNuMjEvZGNuMjFfbGlua19lbmNvZGVyLmMKIGNyZWF0ZSBtb2RlIDEwMDY0
NCBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjEvZGNuMjFfbGlua19lbmNvZGVy
LmgKCi0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
