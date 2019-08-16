Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 32BEB8FE9D
	for <lists+amd-gfx@lfdr.de>; Fri, 16 Aug 2019 10:59:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B1438985A;
	Fri, 16 Aug 2019 08:59:30 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720076.outbound.protection.outlook.com [40.107.72.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9A4689276
 for <amd-gfx@lists.freedesktop.org>; Fri, 16 Aug 2019 08:59:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k3TAUM9KcyINLcI3cVqUpPpujGyTh7G867CZwqc2uV7T94SNUAMZXuSklZlz834lfJlIC4N4hHkg5flMTcTpN77zxW4NDn6oGkqik/QsiY7sI/3cyWq1SunGcOd59cM5pwLPjiRUbFpnfIzdOkh1MmTvzBi6GZDrtRW7+JwZtMieNBWf754hOw3LnUc5WfpYPsWhsmzBb5i8Cu26wak8XA9PrLJMEdhOZqV530ERht8rlg0jCOPD88B9tUqkNrXZ7qbagefGKE/7TyMYkg/NLW79c3ttvlu986IpIdvwBIh+UZd9hVhZYTrzPqLZ6yQ8n89Cyew0z+F5M4R3WUTPSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ncdo1HIZv5Du1GSGiTOYJ4OOnfjT32mo9O1P+HWKYRw=;
 b=a4Rf3iPvL5rH/50sgdB3+FtIqujnY0Cc2FJtT/0nIlzFyIak7K9iWFsPlerc3xQ5HY0J/DXvxfnZt41v+V6S/JKk+wunvvYmH4ZiLDsbhunxCRTd2/dIU6lb5pZhZ/odC+W47JUBY93VVSDgbef+tnFUYLRXajeq0CkZny2StSMaPgGWL6TepZKWlUFjvnf1BAdoLS1lS0uJytndecTdue6VPORm6eMzOS+AYeGe4tJb3sj+PjXfem+gBuw02/zvqaplnBZEYO939XE6rrbsHE3pmtzxymcyTnE2YSCY3I4G73/3QTlsR3xMRkKXh38oz+74xCOw8trb0CDwp1PfPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from MWHPR1201CA0012.namprd12.prod.outlook.com
 (2603:10b6:301:4a::22) by BYAPR12MB2709.namprd12.prod.outlook.com
 (2603:10b6:a03:68::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2157.20; Fri, 16 Aug
 2019 08:59:27 +0000
Received: from DM3NAM03FT043.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::203) by MWHPR1201CA0012.outlook.office365.com
 (2603:10b6:301:4a::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2178.16 via Frontend
 Transport; Fri, 16 Aug 2019 08:59:26 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 DM3NAM03FT043.mail.protection.outlook.com (10.152.83.227) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2178.16 via Frontend Transport; Fri, 16 Aug 2019 08:59:26 +0000
Received: from gigabyte-debug.amd.com (10.34.1.3) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Fri, 16 Aug 2019
 03:59:25 -0500
From: Frank.Min <Frank.Min@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 1/3] amd/amdgpu: add Arcturus vf DID support
Date: Fri, 16 Aug 2019 16:59:18 +0800
Message-ID: <1565945960-21236-1-git-send-email-Frank.Min@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(376002)(396003)(346002)(136003)(2980300002)(428003)(189003)(199004)(478600001)(2906002)(186003)(6916009)(51416003)(5660300002)(8676002)(86362001)(53416004)(305945005)(26005)(47776003)(50466002)(70586007)(81166006)(4326008)(81156014)(4744005)(48376002)(486006)(7696005)(70206006)(2351001)(426003)(316002)(6666004)(356004)(126002)(53936002)(16586007)(336012)(476003)(36756003)(8936002)(2616005)(50226002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB2709; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 30a23696-5edc-48bd-5410-08d722280a3a
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328);
 SRVR:BYAPR12MB2709; 
X-MS-TrafficTypeDiagnostic: BYAPR12MB2709:
X-Microsoft-Antispam-PRVS: <BYAPR12MB2709337EA71193563DA442ECE9AF0@BYAPR12MB2709.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:296;
X-Forefront-PRVS: 0131D22242
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: HX7oQTCpbsY1o9nCZXJQK05kC5ybFp6yfJuLAerL+X5+K/sViCa6B4dEdFXgrQJOl1dsNtFiNxzGlpxR2UCye425z+62qfND9qZXLvBjzbcBwCfxEdMuhfi4D+/FSokz0M+6uErWO52/wBQ/hH6M4B8iRUaNfq7TtjHJjpvUi4pdBTIsFI/F9DIheCxKhsL8HyD74ucqktMvoYTLRRxzhIX/2nb9CBtv0ICM58ae7fXwzlmn7rFW1FgGEGoKQWiO/el3hGMBD4szC6qesqxkADzSl0420JTggP4gzLWnbQnY2yYEm/e0/7xiAsonlFtBtmhEGGFUg/bvCOfLRmiVZX8UOIlr9jqFWNHh2ZO2tZaJf40YruZxbi6u8fTpFKQkWOlW5RDQxCTfM0cDu63qdrfaTlbWYX0S+IcZaQGPSpo=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2019 08:59:26.0555 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 30a23696-5edc-48bd-5410-08d722280a3a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2709
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ncdo1HIZv5Du1GSGiTOYJ4OOnfjT32mo9O1P+HWKYRw=;
 b=AuTk9qhhd7+ZMLMeHlau54B9Dzec7Z0fxQIi612Osoim0DMjFVnLp4vk0HD7726eQqxk9G9paC7XyKnz7ai01tEHuVcpUljmTUNGyhsFkT/ZiwRdHrd5SStO/mGRptvspN+De4JFbmy3kpx5xd84RznSc2hcGTZtgU2EZltyA9s=
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

Q2hhbmdlLUlkOiBJNzE1MzE1Mzc4NWZkZDU0YTEwZWJjNDdlNzc4ZTA2OTgyZWRjNzlkNwpTaWdu
ZWQtb2ZmLWJ5OiBGcmFuay5NaW4gPEZyYW5rLk1pbkBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kcnYuYyB8IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X2Rydi5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5jCmluZGV4IDBl
OGMxNjUuLjM4OTBiYTIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9kcnYuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZHJ2LmMK
QEAgLTk5OSw2ICs5OTksNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHBjaV9kZXZpY2VfaWQgcGNp
aWRsaXN0W10gPSB7CiAJezB4MTAwMiwgMHg3MzhDLCBQQ0lfQU5ZX0lELCBQQ0lfQU5ZX0lELCAw
LCAwLCBDSElQX0FSQ1RVUlVTfSwKIAl7MHgxMDAyLCAweDczODgsIFBDSV9BTllfSUQsIFBDSV9B
TllfSUQsIDAsIDAsIENISVBfQVJDVFVSVVN9LAogCXsweDEwMDIsIDB4NzM4RSwgUENJX0FOWV9J
RCwgUENJX0FOWV9JRCwgMCwgMCwgQ0hJUF9BUkNUVVJVU30sCisJezB4MTAwMiwgMHg3MzkwLCBQ
Q0lfQU5ZX0lELCBQQ0lfQU5ZX0lELCAwLCAwLCBDSElQX0FSQ1RVUlVTfSwKIAkvKiBOYXZpMTAg
Ki8KIAl7MHgxMDAyLCAweDczMTAsIFBDSV9BTllfSUQsIFBDSV9BTllfSUQsIDAsIDAsIENISVBf
TkFWSTEwfSwKIAl7MHgxMDAyLCAweDczMTIsIFBDSV9BTllfSUQsIFBDSV9BTllfSUQsIDAsIDAs
IENISVBfTkFWSTEwfSwKLS0gCjIuNy40CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2FtZC1nZng=
