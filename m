Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E51148FB1B
	for <lists+amd-gfx@lfdr.de>; Fri, 16 Aug 2019 08:33:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BD036EADF;
	Fri, 16 Aug 2019 06:33:58 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680054.outbound.protection.outlook.com [40.107.68.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1050C6EADF
 for <amd-gfx@lists.freedesktop.org>; Fri, 16 Aug 2019 06:33:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XbaLa/x9pmkUT/YxL7k0pttvcPDYe3CGZtk4GZh5O3g35VVnC9/GHEZs2ts0hLf4AAM2DGvtA/6euKf/IdO1bTVgCedoPYvHJKOIo1Y4uaAmaK+zuJt1rM59ny0J/VjQqr+DFT68nTbhwzhAhhf5dGJ3w/DiPZLvE7cNGMnsit+xPQhid1cFW6l7GirjNVmfc0zmyMnz+7+nP4wXan3k9PRYcHxE1jazAa+lIZiDdkhKUwhnWjGm/nbSrlX5++hMEtJdBxh02d6AFq5JbqjWsvjePp4lOtQDfJyiIaz/Cxg3OcAizQlRaobEcvxrcyr/DvVfmiFPaXrmNSAC98dciQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hEHO9PmiUxrwQ60X8BnqggiWR3Jzui9UQN0yjNgHF4s=;
 b=EkbRHl2vaCgO+ptjVtJpbMjSV/L0Eab6sLBVr6iDLWWzs7UH1J/+X2MRY73Sva1ROaXhvFG8Uk7VUOb8DRZBM1N88NBEwXamu8vbwqkb0ca2OOtl31W2966inDa/j1NQEdy2/wqxozP3nyeKLzyGvGmed+2fO+2ra01keno1HQpPc4VFniXUV7bI22itgrRsq7KF+JiItlyrN0ioDh3KKC6e4phPc4EjDNQpkdMzL3l0cIR0jMlS+HuHzvYVVnA06H7OiJ2oRRrL+Ii+1CcfTitPsLCrkiI2IGYriwW+wS00dcgrlx2PJUreZ1qaUfZ7JFbSAsM9U1BH7GYPZZGV3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM5PR12CA0066.namprd12.prod.outlook.com (2603:10b6:3:103::28)
 by BN7PR12MB2707.namprd12.prod.outlook.com (2603:10b6:408:2f::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2157.16; Fri, 16 Aug
 2019 06:33:54 +0000
Received: from DM3NAM03FT014.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::204) by DM5PR12CA0066.outlook.office365.com
 (2603:10b6:3:103::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2178.16 via Frontend
 Transport; Fri, 16 Aug 2019 06:33:54 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 DM3NAM03FT014.mail.protection.outlook.com (10.152.82.81) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2178.16 via Frontend Transport; Fri, 16 Aug 2019 06:33:53 +0000
Received: from guchchen-System-Product-Name.amd.com (10.34.1.3) by
 SATLEXCHOV01.amd.com (10.181.40.71) with Microsoft SMTP Server (TLS) id
 14.3.389.1; Fri, 16 Aug 2019 01:33:52 -0500
From: Guchun Chen <guchun.chen@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <Hawking.Zhang@amd.com>,
 <Dennis.Li@amd.com>, <Xinhui.Pan@amd.com>, <Tao.Zhou1@amd.com>
Subject: [PATCH] drm/amdgpu: remove redundant NULL ptr check
Date: Fri, 16 Aug 2019 14:33:34 +0800
Message-ID: <20190816063334.27995-1-guchun.chen@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(396003)(376002)(346002)(136003)(2980300002)(428003)(199004)(189003)(5660300002)(14444005)(476003)(7696005)(51416003)(336012)(44832011)(2201001)(426003)(2616005)(486006)(50466002)(53936002)(126002)(186003)(356004)(47776003)(70206006)(70586007)(36756003)(86362001)(1076003)(110136005)(6666004)(50226002)(8676002)(6636002)(53416004)(305945005)(16586007)(81166006)(316002)(4326008)(48376002)(81156014)(2906002)(478600001)(26005)(8936002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN7PR12MB2707; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ec62d750-2261-44d5-10bf-08d72213b561
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:BN7PR12MB2707; 
X-MS-TrafficTypeDiagnostic: BN7PR12MB2707:
X-Microsoft-Antispam-PRVS: <BN7PR12MB2707DAF470A43FA6541C14BBF1AF0@BN7PR12MB2707.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-Forefront-PRVS: 0131D22242
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: h7DgFq79UHxWx6bgopPi9/68z1NI8rYReALT1/03ocYnv47+OordA93+pJ/fc+nL0AoL/18qjwXfxRvOl7fdTi9XBoDZXqchkIOClXP2ZnWZqZcumiqOFCvXIWAbiKekFQeSOzls1F9YUsywfewR4j8wbI2JIkGhMj6cGrQZ82MOC51gsr/Fiflce1riM+aI72IM0tY1M1Htb6MY9SF+ro84TWPe3xCb8a/qfidV5mt95Y8zkg8TMmEbrxsqsWsKfoSSSrGzOtfZ3mid+xAFbBoam7myYeCCphx+Ip+qElpmsMjivd5Hv+bhgW6ChneBNnCYgXMZJ3YvHZAi0p2zmi1o4MZs7SeMppqB42fYqfNKM8DdPrLd/yI09fw96mh6FqRkWMoCQ8I7hMolqE6X9xUNXoaxDIxtsaiU+bUpPug=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2019 06:33:53.8024 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ec62d750-2261-44d5-10bf-08d72213b561
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR12MB2707
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hEHO9PmiUxrwQ60X8BnqggiWR3Jzui9UQN0yjNgHF4s=;
 b=YeU/JsN2E+P4fA3NSSvSQ5+3no9XOsdawZaPw1u3QAwhNsncVSxN5mmGrh8Yjkep8QDB9hZvWy01B7xQ3CuVVOFkFxvlSihj3AgcvbadQSmcBurWkmXucxvROjhVpLUYoyevV9AgJkSpZSDN8dLRNhxM7PBwNDxCC0IDtikeVRU=
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
Cc: Guchun Chen <guchun.chen@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhlIGNvcnJlc3BvbmRpbmcgcG9pbnRlciBoYXMgYmVlbiBjaGVja2VkIGF0IHRoZSBlYXJseQpz
dGFnZSBvZiBlYWNoIGZ1bmN0aW9uLgoKQ2hhbmdlLUlkOiBJZDhlMjY0YjRiYTM3MzRmOTFhMzNi
NmYwZjQwODg4NDQ1M2VhNzRmYQpTaWduZWQtb2ZmLWJ5OiBHdWNodW4gQ2hlbiA8Z3VjaHVuLmNo
ZW5AYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmMg
fCAxMyArKysrLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA5IGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV9yYXMuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuYwppbmRleCA1
MGMxM2IwMmQyMzQuLjI1MzUxMWMwNDE5ZCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X3Jhcy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9yYXMuYwpAQCAtMTE3Myw3ICsxMTczLDcgQEAgc3RhdGljIGludCBhbWRncHVfcmFzX2Jh
ZHBhZ2VzX3JlYWQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsCiAKIAltdXRleF9sb2NrKCZj
b24tPnJlY292ZXJ5X2xvY2spOwogCWRhdGEgPSBjb24tPmVoX2RhdGE7Ci0JaWYgKCFkYXRhIHx8
IGRhdGEtPmNvdW50ID09IDApIHsKKwlpZiAoZGF0YS0+Y291bnQgPT0gMCkgewogCQkqYnBzID0g
TlVMTDsKIAkJZ290byBvdXQ7CiAJfQpAQCAtMTMxOCw4ICsxMzE4LDYgQEAgaW50IGFtZGdwdV9y
YXNfYWRkX2JhZF9wYWdlcyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKIAogCW11dGV4X2xv
Y2soJmNvbi0+cmVjb3ZlcnlfbG9jayk7CiAJZGF0YSA9IGNvbi0+ZWhfZGF0YTsKLQlpZiAoIWRh
dGEpCi0JCWdvdG8gb3V0OwogCiAJaWYgKGRhdGEtPnNwYWNlX2xlZnQgPD0gcGFnZXMpCiAJCWlm
IChhbWRncHVfcmFzX3JlYWxsb2NfZWhfZGF0YV9zcGFjZShhZGV2LCBkYXRhLCBwYWdlcykpIHsK
QEAgLTEzNTEsOCArMTM0OSw3IEBAIGludCBhbWRncHVfcmFzX3Jlc2VydmVfYmFkX3BhZ2VzKHN0
cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQogCiAJbXV0ZXhfbG9jaygmY29uLT5yZWNvdmVyeV9s
b2NrKTsKIAlkYXRhID0gY29uLT5laF9kYXRhOwotCWlmICghZGF0YSkKLQkJZ290byBvdXQ7CisK
IAkvKiByZXNlcnZlIHZyYW0gYXQgZHJpdmVyIHBvc3Qgc3RhZ2UuICovCiAJZm9yIChpID0gZGF0
YS0+bGFzdF9yZXNlcnZlZDsgaSA8IGRhdGEtPmNvdW50OyBpKyspIHsKIAkJYnAgPSBkYXRhLT5i
cHNbaV0uYnA7CkBAIC0xMzY0LDcgKzEzNjEsNyBAQCBpbnQgYW1kZ3B1X3Jhc19yZXNlcnZlX2Jh
ZF9wYWdlcyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKIAkJZGF0YS0+YnBzW2ldLmJvID0g
Ym87CiAJCWRhdGEtPmxhc3RfcmVzZXJ2ZWQgPSBpICsgMTsKIAl9Ci1vdXQ6CisKIAltdXRleF91
bmxvY2soJmNvbi0+cmVjb3ZlcnlfbG9jayk7CiAJcmV0dXJuIDA7CiB9CkBAIC0xMzgyLDggKzEz
NzksNiBAQCBzdGF0aWMgaW50IGFtZGdwdV9yYXNfcmVsZWFzZV9iYWRfcGFnZXMoc3RydWN0IGFt
ZGdwdV9kZXZpY2UgKmFkZXYpCiAKIAltdXRleF9sb2NrKCZjb24tPnJlY292ZXJ5X2xvY2spOwog
CWRhdGEgPSBjb24tPmVoX2RhdGE7Ci0JaWYgKCFkYXRhKQotCQlnb3RvIG91dDsKIAogCWZvciAo
aSA9IGRhdGEtPmxhc3RfcmVzZXJ2ZWQgLSAxOyBpID49IDA7IGktLSkgewogCQlibyA9IGRhdGEt
PmJwc1tpXS5ibzsKQEAgLTEzOTMsNyArMTM4OCw3IEBAIHN0YXRpYyBpbnQgYW1kZ3B1X3Jhc19y
ZWxlYXNlX2JhZF9wYWdlcyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKIAkJZGF0YS0+YnBz
W2ldLmJvID0gYm87CiAJCWRhdGEtPmxhc3RfcmVzZXJ2ZWQgPSBpOwogCX0KLW91dDoKKwogCW11
dGV4X3VubG9jaygmY29uLT5yZWNvdmVyeV9sb2NrKTsKIAlyZXR1cm4gMDsKIH0KLS0gCjIuMTcu
MQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdm
eCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
