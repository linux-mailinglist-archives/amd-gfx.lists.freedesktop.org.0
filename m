Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F7FADD09D
	for <lists+amd-gfx@lfdr.de>; Fri, 18 Oct 2019 22:49:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B672B6E060;
	Fri, 18 Oct 2019 20:49:57 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750084.outbound.protection.outlook.com [40.107.75.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C72736E03C
 for <amd-gfx@lists.freedesktop.org>; Fri, 18 Oct 2019 20:49:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fxWNl3Bam/vpCexdCQmceH1ABhV8NoNkGHExrqAoNZD/cX6Iff0YndB1TDUSJ9xt8AFlZWEEolcLhPjOYWwSZkdyswgA1Mv+tfb5VptZhK3V6F51CzcAQCAgxsm2pK51QRHgp9rXm0keIEhcEvcaNHTFIn4/244VvMK5EzHnZ6Odkp6BRG6GrSMF6E66BgVX9ij75QGU2lOQiFilJkxjXIlJQJ7Uwj8//vbZqUPFZG6BXadqvHu6yw7TdkMs0NGpoR7vnk1MEgEjVEEJWLspsdHs+SA2PftNBjcPwZg9mfOmjC7SdNWALEwOtk+1t0w7w7fckt2Tbs06G3AFZCIQ1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3uyQHQyr3PnEHcaJ/Tvnl+969OyV4b6eLmKBJl2BfJE=;
 b=m/e6ZE944a/uCZ7Wm3fbqeW2Rq/b9p4AjOn5S2tml2gtM7v4lNPVQMEWFECsYXfaMSD475mcUiihkxculHSLBPoQBi+WRAPebpMMvReulitwhgzNpofC8Stz73pUX1lxmcp2otgewP1QTasqXJ2bKyrs4d4RBfkfsr7Fz2+4CG5mrgS4N+xO6GUbnZahHzZueMiBmgbOD1q55Rj6F0VKNS1QkvN6EVocP0ily0ShgReAr3BU2qV6nIaRIOeo4W5YDrHO+Ji8wi6D+Y8Sd0d9Fioobrc6zU33WYT+oVwtRUycDgi+b/6DF654OKu32ThZFDLvw3TSh0PLGei4giXQ+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM5PR12CA0004.namprd12.prod.outlook.com (2603:10b6:4:1::14) by
 CH2PR12MB3976.namprd12.prod.outlook.com (2603:10b6:610:28::26) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.19; Fri, 18 Oct 2019 20:49:53 +0000
Received: from BY2NAM03FT035.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::206) by DM5PR12CA0004.outlook.office365.com
 (2603:10b6:4:1::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2367.20 via Frontend
 Transport; Fri, 18 Oct 2019 20:49:53 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 BY2NAM03FT035.mail.protection.outlook.com (10.152.84.223) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.2367.14 via Frontend Transport; Fri, 18 Oct 2019 20:49:53 +0000
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Fri, 18 Oct
 2019 15:49:52 -0500
Received: from agrodzovsky-All-Series.amd.com (10.180.168.240) by
 SATLEXMB02.amd.com (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5
 via Frontend Transport; Fri, 18 Oct 2019 15:49:51 -0500
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 4/4] drm/amdgpu: Move amdgpu_ras_recovery_init to after SMU
 ready.
Date: Fri, 18 Oct 2019 16:48:31 -0400
Message-ID: <1571431711-30149-5-git-send-email-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1571431711-30149-1-git-send-email-andrey.grodzovsky@amd.com>
References: <1571431711-30149-1-git-send-email-andrey.grodzovsky@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(979002)(4636009)(39860400002)(136003)(396003)(346002)(376002)(428003)(199004)(189003)(6916009)(2906002)(14444005)(2351001)(26005)(478600001)(16586007)(316002)(86362001)(5660300002)(186003)(53416004)(36756003)(81166006)(81156014)(8676002)(70206006)(70586007)(305945005)(51416003)(11346002)(44832011)(4326008)(336012)(50466002)(126002)(7696005)(50226002)(486006)(6666004)(476003)(356004)(47776003)(54906003)(76176011)(446003)(426003)(2616005)(48376002)(8936002)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CH2PR12MB3976; H:SATLEXMB01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 17fde147-b84f-418f-fb17-08d7540cba41
X-MS-TrafficTypeDiagnostic: CH2PR12MB3976:
X-Microsoft-Antispam-PRVS: <CH2PR12MB39762AB158A27C1C05335742EA6C0@CH2PR12MB3976.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-Forefront-PRVS: 01949FE337
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: z6T1H9kroeALh4FpYsuFCV8Rfx/zBBGJhrhGMW/XFPCrL2YKCLxHWOxFVICMXeCWZpdfe8zBxOZZsY0OAsgINAzQNgquA082ABVjFWXONT3cHJRxwskp5Hu5bBcjPPR1x+eKFyonP+F8EHYrRwe1SADXNzxiEWJuyYWcOTAJL1/CjNMK32A1mVkxyuQGg1iA5W3FwoKQ/h4CHUubFd/MHmschaLx2+H8fe/uvt5IbtG1SL0VYkpFLhyoYtKt/1JhU5bl65V51jA7lqIatMmvCWrGMG7LHtmhCszZ/90BSiDoFwFRReKvVAg/R3Zr1ihy8DJwvq2qqyn2CbnPMwIF/8gGEZXtSztMmVnAVN+qYzWleNj5ARbLcler9BZo0E+KXZHo5t584xNYbqdurTPhYZZpKDzJn2488rf6E7AfJes=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2019 20:49:53.6160 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 17fde147-b84f-418f-fb17-08d7540cba41
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB3976
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3uyQHQyr3PnEHcaJ/Tvnl+969OyV4b6eLmKBJl2BfJE=;
 b=OPi2+qInDLLN8D1TChKX1jsiT6UMfNyyy4M4DS3XHgFJT68mDj2cPG1zGiLyuTUfK5s/IVRHvOFqBD+pIuzlaowgVUTWrA/OQe6vJA7DjV+CiJ93wvLQhyvb0lOw5lvZI+aZCc8CiRvNrKT1EMmleV+IIQyZ7XB8u/BHsXeeWaQ=
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
Cc: Andrey Grodzovsky <andrey.grodzovsky@amd.com>, Guchun.Chen@amd.com,
 Tao.Zhou1@amd.com, noreply-confluence@amd.com, Alexander.Deucher@amd.com,
 Evan.Quan@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Rm9yIEFyY3R1cnVzIHRoZSBJMkMgdHJhZmZpYyBpcyBkb25lIHRocm91Z2ggU01VIHRhYmxlcyBh
bmQgc28Kd2UgbXVzdCBwb3N0cG9uZSBSQVMgcmVjb3ZlcnkgaW5pdCB0byBhZnRlciB0aGV5IGFy
ZSByZWFkeQp3aGljaCBpcyBpbiBhbWRncHVfZGV2aWNlX2lwX2h3X2luaXRfcGhhc2UyLgoKU2ln
bmVkLW9mZi1ieTogQW5kcmV5IEdyb2R6b3Zza3kgPGFuZHJleS5ncm9kem92c2t5QGFtZC5jb20+
Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jIHwgMTMgKysr
KysrKysrKysrKwogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3R0bS5jICAgIHwg
MTEgLS0tLS0tLS0tLS0KIDIgZmlsZXMgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKSwgMTEgZGVs
ZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X2RldmljZS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jCmlu
ZGV4IDE3Y2ZkYWYuLmM0MGU5YTUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV9kZXZpY2UuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfZGV2aWNlLmMKQEAgLTE4NTAsNiArMTg1MCwxOSBAQCBzdGF0aWMgaW50IGFtZGdwdV9kZXZp
Y2VfaXBfaW5pdChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKIAlpZiAocikKIAkJZ290byBp
bml0X2ZhaWxlZDsKIAorCS8qCisJICogcmV0aXJlZCBwYWdlcyB3aWxsIGJlIGxvYWRlZCBmcm9t
IGVlcHJvbSBhbmQgcmVzZXJ2ZWQgaGVyZSwKKwkgKiBpdCBzaG91bGQgYmUgY2FsbGVkIGFmdGVy
IGFtZGdwdV9kZXZpY2VfaXBfaHdfaW5pdF9waGFzZTIgIHNpbmNlCisJICogZm9yIHNvbWUgQVNJ
Q3MgdGhlIFJBUyBFRVBST00gY29kZSByZWxpZXMgb24gU01VIGZ1bGx5IGZ1bmN0aW9uaW5nCisJ
ICogZm9yIEkyQyBjb21tdW5pY2F0aW9uIHdoaWNoIG9ubHkgdHJ1ZSBhdCB0aGlzIHBvaW50Lgor
CSAqIHJlY292ZXJ5X2luaXQgbWF5IGZhaWwsIGJ1dCBpdCBjYW4gZnJlZSBhbGwgcmVzb3VyY2Vz
IGFsbG9jYXRlZCBieQorCSAqIGl0c2VsZiBhbmQgaXRzIGZhaWx1cmUgc2hvdWxkIG5vdCBzdG9w
IGFtZGdwdSBpbml0IHByb2Nlc3MuCisJICoKKwkgKiBOb3RlOiB0aGVvcmV0aWNhbGx5LCB0aGlz
IHNob3VsZCBiZSBjYWxsZWQgYmVmb3JlIGFsbCB2cmFtIGFsbG9jYXRpb25zCisJICogdG8gcHJv
dGVjdCByZXRpcmVkIHBhZ2UgZnJvbSBhYnVzaW5nCisJICovCisJYW1kZ3B1X3Jhc19yZWNvdmVy
eV9pbml0KGFkZXYpOworCiAJaWYgKGFkZXYtPmdtYy54Z21pLm51bV9waHlzaWNhbF9ub2RlcyA+
IDEpCiAJCWFtZGdwdV94Z21pX2FkZF9kZXZpY2UoYWRldik7CiAJYW1kZ3B1X2FtZGtmZF9kZXZp
Y2VfaW5pdChhZGV2KTsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV90dG0uYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uYwppbmRl
eCAyZTg1YTUxLi4xMDQ1YzNmIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfdHRtLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3R0
bS5jCkBAIC0xNzIxLDE3ICsxNzIxLDYgQEAgaW50IGFtZGdwdV90dG1faW5pdChzdHJ1Y3QgYW1k
Z3B1X2RldmljZSAqYWRldikKICNlbmRpZgogCiAJLyoKLQkgKiByZXRpcmVkIHBhZ2VzIHdpbGwg
YmUgbG9hZGVkIGZyb20gZWVwcm9tIGFuZCByZXNlcnZlZCBoZXJlLAotCSAqIGl0IHNob3VsZCBi
ZSBjYWxsZWQgYWZ0ZXIgdHRtIGluaXQgc2luY2UgbmV3IGJvIG1heSBiZSBjcmVhdGVkLAotCSAq
IHJlY292ZXJ5X2luaXQgbWF5IGZhaWwsIGJ1dCBpdCBjYW4gZnJlZSBhbGwgcmVzb3VyY2VzIGFs
bG9jYXRlZCBieQotCSAqIGl0c2VsZiBhbmQgaXRzIGZhaWx1cmUgc2hvdWxkIG5vdCBzdG9wIGFt
ZGdwdSBpbml0IHByb2Nlc3MuCi0JICoKLQkgKiBOb3RlOiB0aGVvcmV0aWNhbGx5LCB0aGlzIHNo
b3VsZCBiZSBjYWxsZWQgYmVmb3JlIGFsbCB2cmFtIGFsbG9jYXRpb25zCi0JICogdG8gcHJvdGVj
dCByZXRpcmVkIHBhZ2UgZnJvbSBhYnVzaW5nCi0JICovCi0JYW1kZ3B1X3Jhc19yZWNvdmVyeV9p
bml0KGFkZXYpOwotCi0JLyoKIAkgKlRoZSByZXNlcnZlZCB2cmFtIGZvciBmaXJtd2FyZSBtdXN0
IGJlIHBpbm5lZCB0byB0aGUgc3BlY2lmaWVkCiAJICpwbGFjZSBvbiB0aGUgVlJBTSwgc28gcmVz
ZXJ2ZSBpdCBlYXJseS4KIAkgKi8KLS0gCjIuNy40CgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2FtZC1nZng=
