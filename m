Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A687C98501
	for <lists+amd-gfx@lfdr.de>; Wed, 21 Aug 2019 22:02:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0D526E9F8;
	Wed, 21 Aug 2019 20:02:14 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam03on0605.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe48::605])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6E816E9EE;
 Wed, 21 Aug 2019 20:02:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gSvWqotvuajNUaBpZ/JNXxKWn6aKE2/xo4nPD7fTTba9LieU9jFac9eWhAszw4jrPTaZQxMaox8k3AlfIWSVnbTk3QY3R9bkPbEm7RitBwIKX6UKUvw32+ifQ0fj57V38bAKURt01pqp4yJWGhSC1k/xsIa7mdo/1uKSCm4bo6hf52Qe6yIkf6Qn4rbB24WJYeLsBTBrsgpNnSv6xc6d1YKh54+GST/Fzpo30AcDdKojWsg90CiTEudMSecaevJmDexnpTX49kbJbx9HMMZoZI6HIi9z2X5vVKV8257heQ3CZk6NQmC6jZtjHrDeKOJ8rG0scsPKuTLzrXRxAdqu+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZKPQlDHVcoLn+o6GkMm5cYe/vdnwLtl4ky7Lf58QesU=;
 b=E+f9CRfP8v8VI43DUWQLySPxGhLBTzOpjx0vH0WjUHv7b5RKgRXUW8T2XMXCiKSp8IyfJyztFbygWt2QuNpffyLQKKRkKfr4797nvp0Fqb97RLAKvZRp6FlQ9bz0sMkgSZZXHmKVGNH03h87JybTfWyFxl0XV4ok0dzNOHelHyLa7/DNgh2ksBykwlinOB6IwyDaWYAXsuRgloBLZ4Zsxg26BI73NHpsmOoPxUGiCcquCwLLfp0D6/PzwdeZROlJfMv1kx/xLTZRw1dGYo+jZMU+dD12lvweyWvrvApQ0yn5LZcZn+yyjCjcqEZ6pyV7c7VAYFz81+JbzVT3fi/U/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from BN4PR12CA0008.namprd12.prod.outlook.com (2603:10b6:403:2::18)
 by SN6PR12MB2720.namprd12.prod.outlook.com (2603:10b6:805:70::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2178.16; Wed, 21 Aug
 2019 20:02:10 +0000
Received: from CO1NAM03FT063.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::205) by BN4PR12CA0008.outlook.office365.com
 (2603:10b6:403:2::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2199.14 via Frontend
 Transport; Wed, 21 Aug 2019 20:02:10 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 CO1NAM03FT063.mail.protection.outlook.com (10.152.81.61) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2178.16 via Frontend Transport; Wed, 21 Aug 2019 20:02:09 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1;
 Wed, 21 Aug 2019 15:01:45 -0500
From: David Francis <David.Francis@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v3 15/16] drm/amd/display: MST DSC compute fair share
Date: Wed, 21 Aug 2019 16:01:28 -0400
Message-ID: <20190821200129.11575-16-David.Francis@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190821200129.11575-1-David.Francis@amd.com>
References: <20190821200129.11575-1-David.Francis@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39850400004)(346002)(376002)(396003)(136003)(2980300002)(428003)(189003)(199004)(81156014)(8936002)(50226002)(426003)(26005)(81166006)(8676002)(51416003)(2906002)(50466002)(53936002)(110136005)(16586007)(54906003)(70206006)(186003)(336012)(446003)(11346002)(316002)(70586007)(2616005)(126002)(486006)(476003)(30864003)(14444005)(36756003)(478600001)(86362001)(450100002)(1076003)(4326008)(5660300002)(305945005)(49486002)(48376002)(47776003)(6666004)(356004)(76176011);
 DIR:OUT; SFP:1101; SCL:1; SRVR:SN6PR12MB2720; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 42a36df5-1f85-4e88-6bb9-08d726727340
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328);
 SRVR:SN6PR12MB2720; 
X-MS-TrafficTypeDiagnostic: SN6PR12MB2720:
X-Microsoft-Antispam-PRVS: <SN6PR12MB27206A55DE537B7A3D1E4EB9EFAA0@SN6PR12MB2720.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1265;
X-Forefront-PRVS: 0136C1DDA4
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: rKRvoGjiGN0AQC/Xhe3lSR4a5CQlk4zjLIPZ7pX+ZePQtK53UsA/XVH3sD390q7ZrGlLUt6/uckUz3kBgp9F9lu32o2PH0SH66xmGdSbemY7QX3E4dnwbH+h9SLxfirT+4AvPMw+HG840XIzP0tFSECeBsW+m27FqmqAt4ISH/O2Kh/x4Sl6JfVGXYfKHoVUENpjDOWiXrx4HB857+FPgVQtj46W3KJKCHABYcH4rhpmwRq/qUlJJ7/s2bHr0qVNNIJ+4uidoiAp4FDcMetuP86F6n/C1LUyVlc1mGEcuDILOBJueCY3Wf6Le+Uq53jGRnZZoeDQwLqL0KOikBi1V9OnNUOre4YjGSLI909LEaPz2Amlm0kXgR2umDVugioNfLYS1SDYbzrZY0vw+yjr1VOA9qUsoQZ7+MVTyOQSS2A=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2019 20:02:09.5981 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 42a36df5-1f85-4e88-6bb9-08d726727340
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2720
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZKPQlDHVcoLn+o6GkMm5cYe/vdnwLtl4ky7Lf58QesU=;
 b=ndrx9EK3DvZDsQwo+bdNHTkcU0RbloA65OdOVusKLh/D4/WReN3U4xW3KOfTYSzDBwkMGNT4SCBOcTS9KeGipNIfsqodGSJzDCsPTaQDlse7QKzXVPa5A2e/gULCC3q0kiYYcDc/70fQBZhuZT4u+qV5XisNndwNlGT+tummrUY=
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
Cc: David Francis <David.Francis@amd.com>, Wenjing Liu <Wenjing.Liu@amd.com>,
 Nikola Cornij <Nikola.Cornij@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SWYgdGhlcmUgaXMgbGltaXRlZCBsaW5rIGJhbmR3aWR0aCBvbiBhIE1TVCBuZXR3b3JrLAppdCBt
dXN0IGJlIGRpdmlkZWQgZmFpcmx5IGJldHdlZW4gdGhlIHN0cmVhbXMgb24gdGhhdCBuZXR3b3Jr
CgpJbXBsZW1lbnQgYW4gYWxnb3JpdGhtIHRvIGRldGVybWluZSB0aGUgY29ycmVjdCBEU0MgY29u
ZmlnCmZvciBlYWNoIHN0cmVhbQoKVGhlIGFsZ29yaXRobToKVGhpcwogICAgIFsgICAgICAgICAg
ICAgICAgICAgXSAgICAgICAgICAoICkKcmVwcmVzZW50cyB0aGUgcmFuZ2Ugb2YgYmFuZHdpZHRo
cyBwb3NzaWJsZSBmb3IgYSBnaXZlbiBzdHJlYW0uClRoZSBbXSBhcmVhIHJlcHJlc2VudHMgdGhl
IHJhbmdlIG9mIERTQyBjb25maWdzLCBhbmQgdGhlICgpCnJlcHJlc2VudHMgbm8gRFNDLiBUaGUg
YmFuZHdpZHRoIHVzZWQgaW5jcmVhc2VzIGZyb20gbGVmdCB0byByaWdodC4KCkZpcnN0LCB0cnkg
ZGlzYWJsaW5nIERTQyBvbiBhbGwgc3RyZWFtcwogICAgIFsgICAgICAgICAgICAgICAgICBdICAg
ICAgICAgICh8KQogICAgIFsgICAgICAgICAgICAgICAgICAgICBdICAgICAgICAgICAgKHwpCkNo
ZWNrIHRoaXMgYWdhaW5zdCB0aGUgYmFuZHdpZHRoIGxpbWl0cyBvZiB0aGUgbGluayBhbmQgZWFj
aCBicmFuY2gKKGluY2x1ZGluZyBlYWNoIGVuZHBvaW50KS4gSWYgaXQgcGFzc2VzLCB0aGUgam9i
IGlzIGRvbmUKClNlY29uZCwgdHJ5IG1heGltdW0gRFNDIGNvbXByZXNzaW9uIG9uIGFsbCBzdHJl
YW1zCnRoYXQgc3VwcG9ydCBEU0MKICAgICBbfCAgICAgICAgIF0gICAgICAgICggKQogICAgIFt8
ICAgICAgICAgICAgICAgIF0gICAgICAgICAoICkKSWYgdGhpcyBkb2VzIG5vdCBwYXNzLCB0aGVu
IGVuYWJsaW5nIHRoaXMgY29tYmluYXRpb24gb2Ygc3RyZWFtcwppcyBpbXBvc3NpYmxlCgpPdGhl
cndpc2UsIGRpdmlkZSB0aGUgcmVtYWluaW5nIGJhbmR3aWR0aCBldmVubHkgYW1vbmdzdCB0aGUg
c3RyZWFtcwogICAgIFsgICAgICAgIHwgIF0gICAgICAgICAoICkKICAgICBbICAgICAgICB8ICAg
ICAgXSAgICAgICAgKCApCgpJZiBvbmUgb3IgbW9yZSBvZiB0aGUgc3RyZWFtcyByZWFjaCBtaW5p
bXVtIGNvbXByZXNzaW9uLCBldmVubHkKZGl2aWRlIHRoZSByZWFtaW5pbmcgYmFuZHdpZHRoIGFt
b25nc3QgdGhlIHJlbWFpbmluZyBzdHJlYW1zCiAgICAgWyAgICB8XSAoICkKICAgICBbICAgICAg
IHxdICAgKCApCiAgICAgWyAgICAgICAgICAgICAgICAgfCAgIF0gICAgICAgICAgICAgICAoICkK
ICAgICBbICAgICAgICAgICAgICAgICB8ICAgICAgXSAgICAgICAgICAgICAgICAgICggKQoKSWYg
YWxsIHN0cmVhbXMgY2FuIHJlYWNoIG1pbmltdW0gY29tcHJlc3Npb24sIGRpc2FibGUgY29tcHJl
c3Npb24KZ3JlZWRpbHkKICAgICBbICAgICAgfF0gICggKQogICAgIFsgICAgICAgIHxdICAgICgg
KQogICAgIFsgICAgICAgICAgICAgICAgIF0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICh8KQoKUGVyZm9ybSB0aGlzIGFsZ29yaXRobSBvbiBlYWNoIGZ1bGwgdXBkYXRlLCBvbiBlYWNo
IE1TVCBsaW5rCndpdGggYXQgbGVhc3Qgb25lIERTQyBzdHJlYW0gb24gaXQKCkFmdGVyIHRoZSBj
b25maWdzIGFyZSBjb21wdXRlZCwgY2FsbApkY24yMF9hZGRfZHNjX3RvX3N0cmVhbV9yZXNvdXJj
ZSBvbiBlYWNoIHN0cmVhbSB3aXRoIERTQyBlbmFibGVkLgpJdCBpcyBvbmx5IGFmdGVyIGFsbCBz
dHJlYW1zIGFyZSBjcmVhdGVkIHRoYXQgd2UgY2FuIGtub3cgd2hpY2gKb2YgdGhlbSB3aWxsIG5l
ZWQgRFNDLgoKRG8gYWxsIG9mIHRoaXMgYXQgdGhlIGVuZCBvZiBhbWRncHUgYXRvbWljIGNoZWNr
LiAgSWYgaXQgZmFpbHMsCmZhaWwgY2hlY2s7IFRoaXMgY29tYmluYXRpb24gb2YgdGltaW5ncyBj
YW5ub3QgYmUgc3VwcG9ydGVkLgoKQ2M6IFdlbmppbmcgTGl1IDxXZW5qaW5nLkxpdUBhbWQuY29t
PgpDYzogTmlrb2xhIENvcm5paiA8Tmlrb2xhLkNvcm5pakBhbWQuY29tPgpTaWduZWQtb2ZmLWJ5
OiBEYXZpZCBGcmFuY2lzIDxEYXZpZC5GcmFuY2lzQGFtZC5jb20+Ci0tLQogLi4uL2dwdS9kcm0v
YW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jIHwgICA0ICsKIC4uLi9kaXNwbGF5L2Ft
ZGdwdV9kbS9hbWRncHVfZG1fbXN0X3R5cGVzLmMgICB8IDM3NSArKysrKysrKysrKysrKysrKysK
IC4uLi9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1fbXN0X3R5cGVzLmggICB8ICAgNCArCiAu
Li4vZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX3Jlc291cmNlLmMgfCAgIDcgKy0KIC4u
Li9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfcmVzb3VyY2UuaCB8ICAgMSArCiA1IGZp
bGVzIGNoYW5nZWQsIDM4OSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jCmluZGV4IDg0
MjQ5MDU3ZTE4MS4uMTQ1ZmQ3MzAyNWRjIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
ZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMKQEAgLTczMzEsNiArNzMzMSwxMCBAQCBzdGF0
aWMgaW50IGFtZGdwdV9kbV9hdG9taWNfY2hlY2soc3RydWN0IGRybV9kZXZpY2UgKmRldiwKIAkJ
aWYgKHJldCkKIAkJCWdvdG8gZmFpbDsKIAorI2lmZGVmIENPTkZJR19EUk1fQU1EX0RDX0RTQ19T
VVBQT1JUCisJCWlmICghY29tcHV0ZV9tc3RfZHNjX2NvbmZpZ3NfZm9yX3N0YXRlKGRtX3N0YXRl
LT5jb250ZXh0KSkKKwkJCWdvdG8gZmFpbDsKKyNlbmRpZgogCQlpZiAoZGNfdmFsaWRhdGVfZ2xv
YmFsX3N0YXRlKGRjLCBkbV9zdGF0ZS0+Y29udGV4dCwgZmFsc2UpICE9IERDX09LKSB7CiAJCQly
ZXQgPSAtRUlOVkFMOwogCQkJZ290byBmYWlsOwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1fbXN0X3R5cGVzLmMgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9tc3RfdHlwZXMuYwppbmRleCA5
OTc4YzFhMDFlYjcuLjU3YjVhNzExYzMzNiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1fbXN0X3R5cGVzLmMKKysrIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1fbXN0X3R5cGVzLmMKQEAgLTM4
LDYgKzM4LDggQEAKIAogI2luY2x1ZGUgImkyY2F1eF9pbnRlcmZhY2UuaCIKIAorI2luY2x1ZGUg
ImRjL2RjbjIwL2RjbjIwX3Jlc291cmNlLmgiCisKIC8qICNkZWZpbmUgVFJBQ0VfRFBDRCAqLwog
CiAjaWZkZWYgVFJBQ0VfRFBDRApAQCAtNDUyLDMgKzQ1NCwzNzYgQEAgdm9pZCBhbWRncHVfZG1f
aW5pdGlhbGl6ZV9kcF9jb25uZWN0b3Ioc3RydWN0IGFtZGdwdV9kaXNwbGF5X21hbmFnZXIgKmRt
LAogCQlhY29ubmVjdG9yLT5jb25uZWN0b3JfaWQpOwogfQogCisjaWZkZWYgQ09ORklHX0RSTV9B
TURfRENfRFNDX1NVUFBPUlQKK3N0cnVjdCBkc2NfbXN0X2ZhaXJuZXNzX3BhcmFtcyB7CisJc3Ry
dWN0IGRjX2NydGNfdGltaW5nICp0aW1pbmc7CisJc3RydWN0IGRjX3NpbmsgKnNpbms7CisJc3Ry
dWN0IGRjX2RzY19id19yYW5nZSBid19yYW5nZTsKKwlib29sIGNvbXByZXNzaW9uX3Bvc3NpYmxl
OworCXN0cnVjdCBkcm1fZHBfbXN0X3BvcnQgKnBvcnQ7Cit9OworCitzdHJ1Y3QgZHNjX21zdF9m
YWlybmVzc192YXJzIHsKKwlpbnQgcGJuOworCWJvb2wgZHNjX2VuYWJsZWQ7CisJaW50IGJwcF94
MTY7Cit9OworCitzdGF0aWMgYm9vbCBwb3J0X2Rvd25zdHJlYW1fb2ZfYnJhbmNoKHN0cnVjdCBk
cm1fZHBfbXN0X3BvcnQgKnBvcnQsCisJCXN0cnVjdCBkcm1fZHBfbXN0X2JyYW5jaCAqYnJhbmNo
KQoreworCXdoaWxlIChwb3J0LT5wYXJlbnQpIHsKKwkJaWYgKHBvcnQtPnBhcmVudCA9PSBicmFu
Y2gpCisJCQlyZXR1cm4gdHJ1ZTsKKworCQlpZiAocG9ydC0+cGFyZW50LT5wb3J0X3BhcmVudCkK
KwkJCXBvcnQgPSBwb3J0LT5wYXJlbnQtPnBvcnRfcGFyZW50OworCQllbHNlCisJCQlicmVhazsK
Kwl9CisJcmV0dXJuIGZhbHNlOworfQorCitzdGF0aWMgYm9vbCBjaGVja19wYm5fbGltaXRfb25f
YnJhbmNoKHN0cnVjdCBkcm1fZHBfbXN0X2JyYW5jaCAqYnJhbmNoLAorCQlzdHJ1Y3QgZHNjX21z
dF9mYWlybmVzc19wYXJhbXMgKnBhcmFtcywKKwkJc3RydWN0IGRzY19tc3RfZmFpcm5lc3NfdmFy
cyAqdmFycywgaW50IGNvdW50KQoreworCXN0cnVjdCBkcm1fZHBfbXN0X3BvcnQgKnBvcnQ7CisJ
aW50IGk7CisJaW50IHBibl9saW1pdCA9IDA7CisJaW50IHBibl91c2VkID0gMDsKKworCWxpc3Rf
Zm9yX2VhY2hfZW50cnkocG9ydCwgJmJyYW5jaC0+cG9ydHMsIG5leHQpIHsKKwkJaWYgKHBvcnQt
Pm1zdGIpCisJCQlpZiAoIWNoZWNrX3Bibl9saW1pdF9vbl9icmFuY2gocG9ydC0+bXN0YiwgcGFy
YW1zLCB2YXJzLCBjb3VudCkpCisJCQkJcmV0dXJuIGZhbHNlOworCisJCWlmIChwb3J0LT5hdmFp
bGFibGVfcGJuID4gMCkKKwkJCXBibl9saW1pdCA9IHBvcnQtPmF2YWlsYWJsZV9wYm47CisJfQor
CisJZm9yIChpID0gMDsgaSA8IGNvdW50OyBpKyspIHsKKwkJaWYgKHBvcnRfZG93bnN0cmVhbV9v
Zl9icmFuY2gocGFyYW1zW2ldLnBvcnQsIGJyYW5jaCkpCisJCQlwYm5fdXNlZCArPSB2YXJzW2ld
LnBibjsKKwl9CisKKwlpZiAocGJuX3VzZWQgPiBwYm5fbGltaXQpCisJCXJldHVybiBmYWxzZTsK
KworCXJldHVybiB0cnVlOworfQorCitzdGF0aWMgYm9vbCBjaGVja19iYW5kd2lkdGhfbGltaXRz
KHN0cnVjdCBkY19saW5rICpkY19saW5rLAorCQlzdHJ1Y3QgZHNjX21zdF9mYWlybmVzc19wYXJh
bXMgKnBhcmFtcywKKwkJc3RydWN0IGRzY19tc3RfZmFpcm5lc3NfdmFycyAqdmFycywKKwkJaW50
IGNvdW50KQoreworCWludCBsaW5rX3RpbWVzbG90X2xpbWl0ID0gNjM7CisJaW50IGxpbmtfdGlt
ZXNsb3RzX3VzZWQgPSAwOworCWludCBwYm5fcGVyX3RpbWVzbG90OworCWludCBpOworCXN0cnVj
dCBkcm1fZHBfbXN0X3RvcG9sb2d5X21nciAqbXN0X21ncjsKKworCS8qIGtiaXRzIHRvIHBibiwg
ZGl2aWRpbmcgYnkgNjQgKi8KKwlwYm5fcGVyX3RpbWVzbG90ID0gZGNfbGlua19iYW5kd2lkdGhf
a2JwcyhkY19saW5rLAorCQkJZGNfbGlua19nZXRfbGlua19jYXAoZGNfbGluaykpIC8gKDggKiAx
MDAwICogNTQpOworCisJLyogQ2hlY2sgbGluayBiYW5kd2lkdGggbGltaXQgKi8KKwlmb3IgKGkg
PSAwOyBpIDwgY291bnQ7IGkrKykKKwkJbGlua190aW1lc2xvdHNfdXNlZCArPSBESVZfUk9VTkRf
VVAodmFyc1tpXS5wYm4sIHBibl9wZXJfdGltZXNsb3QpOworCisJaWYgKGxpbmtfdGltZXNsb3Rz
X3VzZWQgPiBsaW5rX3RpbWVzbG90X2xpbWl0KQorCQlyZXR1cm4gZmFsc2U7CisKKwkvKiBDaGVj
ayBicmFuY2ggYmFuZHdpZHRoIGxpbWl0IGZvciBlYWNoIHBvcnQgb24gZWFjaCBicmFuY2ggKi8K
Kwltc3RfbWdyID0gcGFyYW1zWzBdLnBvcnQtPm1ncjsKKwlpZiAoIWNoZWNrX3Bibl9saW1pdF9v
bl9icmFuY2gobXN0X21nci0+bXN0X3ByaW1hcnksIHBhcmFtcywgdmFycywgY291bnQpKQorCQly
ZXR1cm4gZmFsc2U7CisKKwlyZXR1cm4gdHJ1ZTsKK30KKworc3RhdGljIGludCBrYnBzX3RvX3Bl
YWtfcGJuKGludCBrYnBzKQoreworCXU2NCBwZWFrX2ticHMgPSBrYnBzOworCisJcGVha19rYnBz
ICo9IDEwMDY7CisJcGVha19rYnBzIC89IDEwMDA7CisJcmV0dXJuIChpbnQpIERJVl9ST1VORF9V
UChwZWFrX2ticHMgKiA2NCwgKDU0ICogOCAqIDEwMDApKTsKK30KKworc3RhdGljIHZvaWQgc2V0
X2RzY19jb25maWdzX2Zyb21fZmFpcm5lc3NfdmFycyhzdHJ1Y3QgZHNjX21zdF9mYWlybmVzc19w
YXJhbXMgKnBhcmFtcywKKwkJc3RydWN0IGRzY19tc3RfZmFpcm5lc3NfdmFycyAqdmFycywKKwkJ
aW50IGNvdW50KQoreworCWludCBpOworCisJZm9yIChpID0gMDsgaSA8IGNvdW50OyBpKyspIHsK
KwkJbWVtc2V0KCZwYXJhbXNbaV0udGltaW5nLT5kc2NfY2ZnLCAwLCBzaXplb2YocGFyYW1zW2ld
LnRpbWluZy0+ZHNjX2NmZykpOworCQlpZiAodmFyc1tpXS5kc2NfZW5hYmxlZCAmJiBkY19kc2Nf
Y29tcHV0ZV9jb25maWcocGFyYW1zW2ldLnNpbmstPmN0eC0+ZGMsCisJCQkJCSZwYXJhbXNbaV0u
c2luay0+c2lua19kc2NfY2Fwcy5kc2NfZGVjX2NhcHMsCisJCQkJCTAsCisJCQkJCXBhcmFtc1tp
XS50aW1pbmcsCisJCQkJCSZwYXJhbXNbaV0udGltaW5nLT5kc2NfY2ZnKSkgeworCQkJcGFyYW1z
W2ldLnRpbWluZy0+ZmxhZ3MuRFNDID0gMTsKKwkJCXBhcmFtc1tpXS50aW1pbmctPmRzY19jZmcu
Yml0c19wZXJfcGl4ZWwgPSB2YXJzW2ldLmJwcF94MTY7CisJCX0gZWxzZSB7CisJCQlwYXJhbXNb
aV0udGltaW5nLT5mbGFncy5EU0MgPSAwOworCQl9CisKKwl9CisKK30KKworc3RhdGljIGludCBi
cHBfeDE2X2Zyb21fcGJuKHN0cnVjdCBkc2NfbXN0X2ZhaXJuZXNzX3BhcmFtcyBwYXJhbSwgaW50
IHBibikKK3sKKwlzdHJ1Y3QgZGNfZHNjX2NvbmZpZyBkc2NfY29uZmlnOworCXU2NCBrYnBzOwor
CisJa2JwcyA9ICh1NjQpcGJuICogOTk0ICogOCAqIDU0IC8gNjQ7CisJZGNfZHNjX2NvbXB1dGVf
Y29uZmlnKHBhcmFtLnNpbmstPmN0eC0+ZGMsCisJCQkmcGFyYW0uc2luay0+c2lua19kc2NfY2Fw
cy5kc2NfZGVjX2NhcHMsCisJCQkoaW50KSBrYnBzLCBwYXJhbS50aW1pbmcsICZkc2NfY29uZmln
KTsKKworCXJldHVybiBkc2NfY29uZmlnLmJpdHNfcGVyX3BpeGVsOworfQorCitzdGF0aWMgdm9p
ZCBpbmNyZWFzZV9kc2NfYnBwKHN0cnVjdCBkY19saW5rICpkY19saW5rLAorCQlzdHJ1Y3QgZHNj
X21zdF9mYWlybmVzc19wYXJhbXMgKnBhcmFtcywKKwkJc3RydWN0IGRzY19tc3RfZmFpcm5lc3Nf
dmFycyAqdmFycywKKwkJaW50IGNvdW50KQoreworCWludCBpOworCWJvb2wgYnBwX2luY3JlYXNl
ZFtNQVhfUElQRVNdOworCWludCBpbml0aWFsX3NsYWNrW01BWF9QSVBFU107CisJaW50IG1pbl9p
bml0aWFsX3NsYWNrOworCWludCBuZXh0X2luZGV4OworCWludCByZW1haW5pbmdfdG9faW5jcmVh
c2UgPSAwOworCWludCBwYm5fcGVyX3RpbWVzbG90OworCWludCBsaW5rX3RpbWVzbG90c191c2Vk
OworCWludCBmYWlyX3Bibl9hbGxvYzsKKworCWZvciAoaSA9IDA7IGkgPCBjb3VudDsgaSsrKSB7
CisJCWlmICh2YXJzW2ldLmRzY19lbmFibGVkKSB7CisJCQlpbml0aWFsX3NsYWNrW2ldID0ga2Jw
c190b19wZWFrX3BibihwYXJhbXNbaV0uYndfcmFuZ2UubWF4X2ticHMpIC0gdmFyc1tpXS5wYm47
CisJCQlicHBfaW5jcmVhc2VkW2ldID0gZmFsc2U7CisJCQlyZW1haW5pbmdfdG9faW5jcmVhc2Ug
Kz0gMTsKKwkJfSBlbHNlIHsKKwkJCWluaXRpYWxfc2xhY2tbaV0gPSAwOworCQkJYnBwX2luY3Jl
YXNlZFtpXSA9IHRydWU7CisJCX0KKwl9CisKKwlwYm5fcGVyX3RpbWVzbG90ID0gZGNfbGlua19i
YW5kd2lkdGhfa2JwcyhkY19saW5rLAorCQkJZGNfbGlua19nZXRfbGlua19jYXAoZGNfbGluaykp
IC8gKDggKiAxMDAwICogNTQpOworCisJd2hpbGUgKHJlbWFpbmluZ190b19pbmNyZWFzZSkgewor
CQluZXh0X2luZGV4ID0gLTE7CisJCW1pbl9pbml0aWFsX3NsYWNrID0gLTE7CisJCWZvciAoaSA9
IDA7IGkgPCBjb3VudDsgaSsrKSB7CisJCQlpZiAoIWJwcF9pbmNyZWFzZWRbaV0pIHsKKwkJCQlp
ZiAobWluX2luaXRpYWxfc2xhY2sgPT0gLTEgfHwgbWluX2luaXRpYWxfc2xhY2sgPiBpbml0aWFs
X3NsYWNrW2ldKSB7CisJCQkJCW1pbl9pbml0aWFsX3NsYWNrID0gaW5pdGlhbF9zbGFja1tpXTsK
KwkJCQkJbmV4dF9pbmRleCA9IGk7CisJCQkJfQorCQkJfQorCQl9CisKKwkJaWYgKG5leHRfaW5k
ZXggPT0gLTEpCisJCQlicmVhazsKKworCQlsaW5rX3RpbWVzbG90c191c2VkID0gMDsKKworCQlm
b3IgKGkgPSAwOyBpIDwgY291bnQ7IGkrKykKKwkJCWxpbmtfdGltZXNsb3RzX3VzZWQgKz0gRElW
X1JPVU5EX1VQKHZhcnNbaV0ucGJuLCBwYm5fcGVyX3RpbWVzbG90KTsKKworCQlmYWlyX3Bibl9h
bGxvYyA9ICg2MyAtIGxpbmtfdGltZXNsb3RzX3VzZWQpIC8gcmVtYWluaW5nX3RvX2luY3JlYXNl
ICogcGJuX3Blcl90aW1lc2xvdDsKKworCQlpZiAoaW5pdGlhbF9zbGFja1tuZXh0X2luZGV4XSA+
IGZhaXJfcGJuX2FsbG9jKSB7CisJCQl2YXJzW25leHRfaW5kZXhdLnBibiArPSBmYWlyX3Bibl9h
bGxvYzsKKwkJCWlmIChjaGVja19iYW5kd2lkdGhfbGltaXRzKGRjX2xpbmssIHBhcmFtcywgdmFy
cywgY291bnQpKQorCQkJCXZhcnNbbmV4dF9pbmRleF0uYnBwX3gxNiA9IGJwcF94MTZfZnJvbV9w
Ym4ocGFyYW1zW25leHRfaW5kZXhdLCB2YXJzW25leHRfaW5kZXhdLnBibik7CisJCQllbHNlCisJ
CQkJdmFyc1tuZXh0X2luZGV4XS5wYm4gLT0gZmFpcl9wYm5fYWxsb2M7CisJCX0gZWxzZSB7CisJ
CQl2YXJzW25leHRfaW5kZXhdLnBibiArPSBpbml0aWFsX3NsYWNrW25leHRfaW5kZXhdOworCQkJ
aWYgKGNoZWNrX2JhbmR3aWR0aF9saW1pdHMoZGNfbGluaywgcGFyYW1zLCB2YXJzLCBjb3VudCkp
CisJCQkJdmFyc1tuZXh0X2luZGV4XS5icHBfeDE2ID0gcGFyYW1zW25leHRfaW5kZXhdLmJ3X3Jh
bmdlLm1heF90YXJnZXRfYnBwX3gxNjsKKwkJCWVsc2UKKwkJCQl2YXJzW25leHRfaW5kZXhdLnBi
biAtPSBpbml0aWFsX3NsYWNrW25leHRfaW5kZXhdOworCQl9CisKKwkJYnBwX2luY3JlYXNlZFtu
ZXh0X2luZGV4XSA9IHRydWU7CisJCXJlbWFpbmluZ190b19pbmNyZWFzZS0tOworCX0KK30KKwor
c3RhdGljIHZvaWQgdHJ5X2Rpc2FibGVfZHNjKHN0cnVjdCBkY19saW5rICpkY19saW5rLAorCQlz
dHJ1Y3QgZHNjX21zdF9mYWlybmVzc19wYXJhbXMgKnBhcmFtcywKKwkJc3RydWN0IGRzY19tc3Rf
ZmFpcm5lc3NfdmFycyAqdmFycywKKwkJaW50IGNvdW50KQoreworCWludCBpOworCWJvb2wgdHJp
ZWRbTUFYX1BJUEVTXTsKKwlpbnQga2Jwc19pbmNyZWFzZVtNQVhfUElQRVNdOworCWludCBtYXhf
a2Jwc19pbmNyZWFzZTsKKwlpbnQgbmV4dF9pbmRleDsKKwlpbnQgcmVtYWluaW5nX3RvX3RyeSA9
IDA7CisKKwlmb3IgKGkgPSAwOyBpIDwgY291bnQ7IGkrKykgeworCQlpZiAodmFyc1tpXS5kc2Nf
ZW5hYmxlZCAmJiB2YXJzW2ldLmJwcF94MTYgPT0gcGFyYW1zW2ldLmJ3X3JhbmdlLm1heF90YXJn
ZXRfYnBwX3gxNikgeworCQkJa2Jwc19pbmNyZWFzZVtpXSA9IHBhcmFtc1tpXS5id19yYW5nZS5z
dHJlYW1fa2JwcyAtIHBhcmFtc1tpXS5id19yYW5nZS5tYXhfa2JwczsKKwkJCXRyaWVkW2ldID0g
ZmFsc2U7CisJCQlyZW1haW5pbmdfdG9fdHJ5ICs9IDE7CisJCX0gZWxzZSB7CisJCQlrYnBzX2lu
Y3JlYXNlW2ldID0gMDsKKwkJCXRyaWVkW2ldID0gdHJ1ZTsKKwkJfQorCX0KKworCXdoaWxlIChy
ZW1haW5pbmdfdG9fdHJ5KSB7CisJCW5leHRfaW5kZXggPSAtMTsKKwkJbWF4X2ticHNfaW5jcmVh
c2UgPSAtMTsKKwkJZm9yIChpID0gMDsgaSA8IGNvdW50OyBpKyspIHsKKwkJCWlmICghdHJpZWRb
aV0pIHsKKwkJCQlpZiAobWF4X2ticHNfaW5jcmVhc2UgPT0gLTEgfHwgbWF4X2ticHNfaW5jcmVh
c2UgPCBrYnBzX2luY3JlYXNlW2ldKSB7CisJCQkJCW1heF9rYnBzX2luY3JlYXNlID0ga2Jwc19p
bmNyZWFzZVtpXTsKKwkJCQkJbmV4dF9pbmRleCA9IGk7CisJCQkJfQorCQkJfQorCQl9CisKKwkJ
aWYgKG5leHRfaW5kZXggPT0gLTEpCisJCQlicmVhazsKKworCQl2YXJzW25leHRfaW5kZXhdLnBi
biA9IGticHNfdG9fcGVha19wYm4ocGFyYW1zW25leHRfaW5kZXhdLmJ3X3JhbmdlLnN0cmVhbV9r
YnBzKTsKKworCQlpZiAoY2hlY2tfYmFuZHdpZHRoX2xpbWl0cyhkY19saW5rLCBwYXJhbXMsIHZh
cnMsIGNvdW50KSkgeworCQkJdmFyc1tuZXh0X2luZGV4XS5kc2NfZW5hYmxlZCA9IGZhbHNlOwor
CQkJdmFyc1tuZXh0X2luZGV4XS5icHBfeDE2ID0gMDsKKwkJfSBlbHNlIHsKKwkJCXZhcnNbbmV4
dF9pbmRleF0ucGJuID0ga2Jwc190b19wZWFrX3BibihwYXJhbXNbbmV4dF9pbmRleF0uYndfcmFu
Z2UubWF4X2ticHMpOworCQl9CisKKwkJdHJpZWRbbmV4dF9pbmRleF0gPSB0cnVlOworCQlyZW1h
aW5pbmdfdG9fdHJ5LS07CisJfQorfQorCitzdGF0aWMgYm9vbCBjb21wdXRlX21zdF9kc2NfY29u
Zmlnc19mb3JfbGluayhzdHJ1Y3QgZGNfc3RhdGUgKmRjX3N0YXRlLCBzdHJ1Y3QgZGNfbGluayAq
ZGNfbGluaykKK3sKKwlpbnQgaTsKKwlzdHJ1Y3QgZGNfc3RyZWFtX3N0YXRlICpzdHJlYW07CisJ
c3RydWN0IGRzY19tc3RfZmFpcm5lc3NfcGFyYW1zIHBhcmFtc1tNQVhfUElQRVNdOworCXN0cnVj
dCBkc2NfbXN0X2ZhaXJuZXNzX3ZhcnMgdmFyc1tNQVhfUElQRVNdOworCXN0cnVjdCBhbWRncHVf
ZG1fY29ubmVjdG9yICphY29ubmVjdG9yOworCWludCBjb3VudCA9IDA7CisKKwltZW1zZXQocGFy
YW1zLCAwLCBzaXplb2YocGFyYW1zKSk7CisKKwkvKiBTZXQgdXAgcGFyYW1zICovCisJZm9yIChp
ID0gMDsgaSA8IGRjX3N0YXRlLT5zdHJlYW1fY291bnQ7IGkrKykgeworCQlzdHJlYW0gPSBkY19z
dGF0ZS0+c3RyZWFtc1tpXTsKKworCQlpZiAoc3RyZWFtLT5saW5rICE9IGRjX2xpbmspCisJCQlj
b250aW51ZTsKKworCQlzdHJlYW0tPnRpbWluZy5mbGFncy5EU0MgPSAwOworCisJCXBhcmFtc1tj
b3VudF0udGltaW5nID0gJnN0cmVhbS0+dGltaW5nOworCQlwYXJhbXNbY291bnRdLnNpbmsgPSBz
dHJlYW0tPnNpbms7CisJCWFjb25uZWN0b3IgPSAoc3RydWN0IGFtZGdwdV9kbV9jb25uZWN0b3Ig
KilzdHJlYW0tPmRtX3N0cmVhbV9jb250ZXh0OworCQlwYXJhbXNbY291bnRdLnBvcnQgPSBhY29u
bmVjdG9yLT5wb3J0OworCQlwYXJhbXNbY291bnRdLmNvbXByZXNzaW9uX3Bvc3NpYmxlID0gc3Ry
ZWFtLT5zaW5rLT5zaW5rX2RzY19jYXBzLmRzY19kZWNfY2Fwcy5pc19kc2Nfc3VwcG9ydGVkOwor
CQlpZiAoIWRjX2RzY19jb21wdXRlX2JhbmR3aWR0aF9yYW5nZShzdHJlYW0tPnNpbmstPmN0eC0+
ZGMsIDgsIDE2LAorCQkJCSZzdHJlYW0tPnNpbmstPnNpbmtfZHNjX2NhcHMuZHNjX2RlY19jYXBz
LAorCQkJCSZzdHJlYW0tPnRpbWluZywgJnBhcmFtc1tjb3VudF0uYndfcmFuZ2UpKQorCQkJcGFy
YW1zW2NvdW50XS5id19yYW5nZS5zdHJlYW1fa2JwcyA9IGRjX2JhbmR3aWR0aF9pbl9rYnBzX2Zy
b21fdGltaW5nKCZzdHJlYW0tPnRpbWluZyk7CisKKwkJY291bnQrKzsKKwl9CisKKwkvKiBUcnkg
bm8gY29tcHJlc3Npb24gKi8KKwlmb3IgKGkgPSAwOyBpIDwgY291bnQ7IGkrKykgeworCQl2YXJz
W2ldLnBibiA9IGticHNfdG9fcGVha19wYm4ocGFyYW1zW2ldLmJ3X3JhbmdlLnN0cmVhbV9rYnBz
KTsKKwkJdmFyc1tpXS5kc2NfZW5hYmxlZCA9IGZhbHNlOworCQl2YXJzW2ldLmJwcF94MTYgPSAw
OworCX0KKworCWlmIChjaGVja19iYW5kd2lkdGhfbGltaXRzKGRjX2xpbmssIHBhcmFtcywgdmFy
cywgY291bnQpKSB7CisJCXNldF9kc2NfY29uZmlnc19mcm9tX2ZhaXJuZXNzX3ZhcnMocGFyYW1z
LCB2YXJzLCBjb3VudCk7CisJCXJldHVybiB0cnVlOworCX0KKworCS8qIFRyeSBtYXggY29tcHJl
c3Npb24gKi8KKwlmb3IgKGkgPSAwOyBpIDwgY291bnQ7IGkrKykgeworCQlpZiAocGFyYW1zW2ld
LmNvbXByZXNzaW9uX3Bvc3NpYmxlKSB7CisJCQl2YXJzW2ldLnBibiA9IGticHNfdG9fcGVha19w
Ym4ocGFyYW1zW2ldLmJ3X3JhbmdlLm1pbl9rYnBzKTsKKwkJCXZhcnNbaV0uZHNjX2VuYWJsZWQg
PSB0cnVlOworCQkJdmFyc1tpXS5icHBfeDE2ID0gcGFyYW1zW2ldLmJ3X3JhbmdlLm1pbl90YXJn
ZXRfYnBwX3gxNjsKKwkJfSBlbHNlIHsKKwkJCXZhcnNbaV0ucGJuID0ga2Jwc190b19wZWFrX3Bi
bihwYXJhbXNbaV0uYndfcmFuZ2Uuc3RyZWFtX2ticHMpOworCQkJdmFyc1tpXS5kc2NfZW5hYmxl
ZCA9IGZhbHNlOworCQkJdmFyc1tpXS5icHBfeDE2ID0gMDsKKwkJfQorCX0KKworCWlmICghY2hl
Y2tfYmFuZHdpZHRoX2xpbWl0cyhkY19saW5rLCBwYXJhbXMsIHZhcnMsIGNvdW50KSkKKwkJcmV0
dXJuIGZhbHNlOworCisJLyogT3B0aW1pemUgZGVncmVlIG9mIGNvbXByZXNzaW9uICovCisJaW5j
cmVhc2VfZHNjX2JwcChkY19saW5rLCBwYXJhbXMsIHZhcnMsIGNvdW50KTsKKworCXRyeV9kaXNh
YmxlX2RzYyhkY19saW5rLCBwYXJhbXMsIHZhcnMsIGNvdW50KTsKKworCXNldF9kc2NfY29uZmln
c19mcm9tX2ZhaXJuZXNzX3ZhcnMocGFyYW1zLCB2YXJzLCBjb3VudCk7CisKKwlyZXR1cm4gdHJ1
ZTsKK30KKworYm9vbCBjb21wdXRlX21zdF9kc2NfY29uZmlnc19mb3Jfc3RhdGUoc3RydWN0IGRj
X3N0YXRlICpkY19zdGF0ZSkKK3sKKwlpbnQgaSwgajsKKwlzdHJ1Y3QgZGNfc3RyZWFtX3N0YXRl
ICpzdHJlYW07CisJYm9vbCBjb21wdXRlZF9zdHJlYW1zW01BWF9QSVBFU107CisJc3RydWN0IGFt
ZGdwdV9kbV9jb25uZWN0b3IgKmFjb25uZWN0b3I7CisKKwlmb3IgKGkgPSAwOyBpIDwgZGNfc3Rh
dGUtPnN0cmVhbV9jb3VudDsgaSsrKQorCQljb21wdXRlZF9zdHJlYW1zW2ldID0gZmFsc2U7CisK
Kwlmb3IgKGkgPSAwOyBpIDwgZGNfc3RhdGUtPnN0cmVhbV9jb3VudDsgaSsrKSB7CisJCXN0cmVh
bSA9IGRjX3N0YXRlLT5zdHJlYW1zW2ldOworCisJCWlmIChzdHJlYW0tPnNpZ25hbCAhPSBTSUdO
QUxfVFlQRV9ESVNQTEFZX1BPUlRfTVNUKQorCQkJY29udGludWU7CisKKwkJYWNvbm5lY3RvciA9
IChzdHJ1Y3QgYW1kZ3B1X2RtX2Nvbm5lY3RvciAqKXN0cmVhbS0+ZG1fc3RyZWFtX2NvbnRleHQ7
CisKKwkJaWYgKCFhY29ubmVjdG9yIHx8ICFhY29ubmVjdG9yLT5kY19zaW5rKQorCQkJY29udGlu
dWU7CisKKwkJaWYgKCFhY29ubmVjdG9yLT5kY19zaW5rLT5zaW5rX2RzY19jYXBzLmRzY19kZWNf
Y2Fwcy5pc19kc2Nfc3VwcG9ydGVkKQorCQkJY29udGludWU7CisKKwkJaWYgKGNvbXB1dGVkX3N0
cmVhbXNbaV0pCisJCQljb250aW51ZTsKKworCQlpZiAoIWNvbXB1dGVfbXN0X2RzY19jb25maWdz
X2Zvcl9saW5rKGRjX3N0YXRlLCBzdHJlYW0tPmxpbmspKQorCQkJcmV0dXJuIGZhbHNlOworCisJ
CWZvciAoaiA9IDA7IGogPCBkY19zdGF0ZS0+c3RyZWFtX2NvdW50OyBqKyspIHsKKwkJCWlmIChk
Y19zdGF0ZS0+c3RyZWFtc1tqXS0+bGluayA9PSBzdHJlYW0tPmxpbmspCisJCQkJY29tcHV0ZWRf
c3RyZWFtc1tqXSA9IHRydWU7CisJCX0KKwl9CisKKwlmb3IgKGkgPSAwOyBpIDwgZGNfc3RhdGUt
PnN0cmVhbV9jb3VudDsgaSsrKSB7CisJCXN0cmVhbSA9IGRjX3N0YXRlLT5zdHJlYW1zW2ldOwor
CisJCWlmIChzdHJlYW0tPnRpbWluZy5mbGFncy5EU0MgPT0gMSkKKwkJCWRjbjIwX2FkZF9kc2Nf
dG9fc3RyZWFtX3Jlc291cmNlKHN0cmVhbS0+Y3R4LT5kYywgZGNfc3RhdGUsIHN0cmVhbSk7CisJ
fQorCisJcmV0dXJuIHRydWU7Cit9CisjZW5kaWYKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtX21zdF90eXBlcy5oIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1fbXN0X3R5cGVzLmgKaW5kZXgg
MmRhODUxYjQwMDQyLi5kYTk1NzYxMTIxNGEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtX21zdF90eXBlcy5oCisrKyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtX21zdF90eXBlcy5oCkBAIC0z
Miw0ICszMiw4IEBAIHN0cnVjdCBhbWRncHVfZG1fY29ubmVjdG9yOwogdm9pZCBhbWRncHVfZG1f
aW5pdGlhbGl6ZV9kcF9jb25uZWN0b3Ioc3RydWN0IGFtZGdwdV9kaXNwbGF5X21hbmFnZXIgKmRt
LAogCQkJCSAgICAgICBzdHJ1Y3QgYW1kZ3B1X2RtX2Nvbm5lY3RvciAqYWNvbm5lY3Rvcik7CiAK
KworI2lmZGVmIENPTkZJR19EUk1fQU1EX0RDX0RTQ19TVVBQT1JUCitib29sIGNvbXB1dGVfbXN0
X2RzY19jb25maWdzX2Zvcl9zdGF0ZShzdHJ1Y3QgZGNfc3RhdGUgKmRjX3N0YXRlKTsKKyNlbmRp
ZgogI2VuZGlmCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNu
MjAvZGNuMjBfcmVzb3VyY2UuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24y
MC9kY24yMF9yZXNvdXJjZS5jCmluZGV4IGM1OWYzMWRjZGMwZC4uMjI1MTFiMDQ3ODM3IDEwMDY0
NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfcmVzb3Vy
Y2UuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfcmVz
b3VyY2UuYwpAQCAtMTQzOSw3ICsxNDM5LDcgQEAgc3RhdGljIHZvaWQgcmVsZWFzZV9kc2Moc3Ry
dWN0IHJlc291cmNlX2NvbnRleHQgKnJlc19jdHgsCiAKIAogI2lmZGVmIENPTkZJR19EUk1fQU1E
X0RDX0RTQ19TVVBQT1JUCi1zdGF0aWMgZW51bSBkY19zdGF0dXMgYWRkX2RzY190b19zdHJlYW1f
cmVzb3VyY2Uoc3RydWN0IGRjICpkYywKK2VudW0gZGNfc3RhdHVzIGRjbjIwX2FkZF9kc2NfdG9f
c3RyZWFtX3Jlc291cmNlKHN0cnVjdCBkYyAqZGMsCiAJCXN0cnVjdCBkY19zdGF0ZSAqZGNfY3R4
LAogCQlzdHJ1Y3QgZGNfc3RyZWFtX3N0YXRlICpkY19zdHJlYW0pCiB7CkBAIC0xNDU0LDYgKzE0
NTQsOSBAQCBzdGF0aWMgZW51bSBkY19zdGF0dXMgYWRkX2RzY190b19zdHJlYW1fcmVzb3VyY2Uo
c3RydWN0IGRjICpkYywKIAkJaWYgKHBpcGVfY3R4LT5zdHJlYW0gIT0gZGNfc3RyZWFtKQogCQkJ
Y29udGludWU7CiAKKwkJaWYgKHBpcGVfY3R4LT5zdHJlYW1fcmVzLmRzYykKKwkJCWNvbnRpbnVl
OworCiAJCWFjcXVpcmVfZHNjKCZkY19jdHgtPnJlc19jdHgsIHBvb2wsICZwaXBlX2N0eC0+c3Ry
ZWFtX3Jlcy5kc2MpOwogCiAJCS8qIFRoZSBudW1iZXIgb2YgRFNDcyBjYW4gYmUgbGVzcyB0aGFu
IHRoZSBudW1iZXIgb2YgcGlwZXMgKi8KQEAgLTE1MTEsNyArMTUxNCw3IEBAIGVudW0gZGNfc3Rh
dHVzIGRjbjIwX2FkZF9zdHJlYW1fdG9fY3R4KHN0cnVjdCBkYyAqZGMsIHN0cnVjdCBkY19zdGF0
ZSAqbmV3X2N0eCwKICNpZmRlZiBDT05GSUdfRFJNX0FNRF9EQ19EU0NfU1VQUE9SVAogCS8qIEdl
dCBhIERTQyBpZiByZXF1aXJlZCBhbmQgYXZhaWxhYmxlICovCiAJaWYgKHJlc3VsdCA9PSBEQ19P
SyAmJiBkY19zdHJlYW0tPnRpbWluZy5mbGFncy5EU0MpCi0JCXJlc3VsdCA9IGFkZF9kc2NfdG9f
c3RyZWFtX3Jlc291cmNlKGRjLCBuZXdfY3R4LCBkY19zdHJlYW0pOworCQlyZXN1bHQgPSBkY24y
MF9hZGRfZHNjX3RvX3N0cmVhbV9yZXNvdXJjZShkYywgbmV3X2N0eCwgZGNfc3RyZWFtKTsKICNl
bmRpZgogCiAJaWYgKHJlc3VsdCA9PSBEQ19PSykKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9yZXNvdXJjZS5oIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX3Jlc291cmNlLmgKaW5kZXggNDRmOTVhYTBkNjFl
Li4yMjA5ZWJkYTZlZjYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9k
Yy9kY24yMC9kY24yMF9yZXNvdXJjZS5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxh
eS9kYy9kY24yMC9kY24yMF9yZXNvdXJjZS5oCkBAIC0xMzEsNiArMTMxLDcgQEAgdm9pZCBkY24y
MF9jYWxjdWxhdGVfZGxnX3BhcmFtcygKIAogZW51bSBkY19zdGF0dXMgZGNuMjBfYnVpbGRfbWFw
cGVkX3Jlc291cmNlKGNvbnN0IHN0cnVjdCBkYyAqZGMsIHN0cnVjdCBkY19zdGF0ZSAqY29udGV4
dCwgc3RydWN0IGRjX3N0cmVhbV9zdGF0ZSAqc3RyZWFtKTsKIGVudW0gZGNfc3RhdHVzIGRjbjIw
X2FkZF9zdHJlYW1fdG9fY3R4KHN0cnVjdCBkYyAqZGMsIHN0cnVjdCBkY19zdGF0ZSAqbmV3X2N0
eCwgc3RydWN0IGRjX3N0cmVhbV9zdGF0ZSAqZGNfc3RyZWFtKTsKK2VudW0gZGNfc3RhdHVzIGRj
bjIwX2FkZF9kc2NfdG9fc3RyZWFtX3Jlc291cmNlKHN0cnVjdCBkYyAqZGMsIHN0cnVjdCBkY19z
dGF0ZSAqZGNfY3R4LCBzdHJ1Y3QgZGNfc3RyZWFtX3N0YXRlICpkY19zdHJlYW0pOwogZW51bSBk
Y19zdGF0dXMgZGNuMjBfcmVtb3ZlX3N0cmVhbV9mcm9tX2N0eChzdHJ1Y3QgZGMgKmRjLCBzdHJ1
Y3QgZGNfc3RhdGUgKm5ld19jdHgsIHN0cnVjdCBkY19zdHJlYW1fc3RhdGUgKmRjX3N0cmVhbSk7
CiBlbnVtIGRjX3N0YXR1cyBkY24yMF9nZXRfZGVmYXVsdF9zd2l6emxlX21vZGUoc3RydWN0IGRj
X3BsYW5lX3N0YXRlICpwbGFuZV9zdGF0ZSk7CiAKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1k
LWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
